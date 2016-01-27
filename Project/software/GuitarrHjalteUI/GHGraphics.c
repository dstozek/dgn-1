/*
 * GHGraphics.c
 *
 * A number of wrapper methods over the Altera UP Pixel Buffer are introduced here.
 * They provide the basic functionality for blitting images, blending pixels and drawing lines.
 *
 * This module could benefit from refactoring and removing some overlapping functionality which amassed during the course of the development.
 *
 *  Created on: 2010-05-09
 *      Author: Tomasz Kaczmarczyk
 */

#include "GHGraphics.h"
#include "GHTime.h"
#include <altera_up_avalon_pixel_buffer.h>
#include <stdio.h>
#include <string.h>
#include <io.h>

static alt_up_pixel_buffer_dev* pixelBuffer;

static int initPixelBuffer()
{
	//Initialize hardware
	pixelBuffer = alt_up_pixel_buffer_open_dev(PIXEL_BUFFER_NAME);
	if(pixelBuffer==NULL) return 1;

	//Copy the background from the FLASH memory to the pixel buffers
	memcpy(pixelBuffer->back_buffer_start_address, FLASH_STORAGE_BASE, BACKGROUND_IMAGE_SIZE);
	memcpy(pixelBuffer->buffer_start_address, FLASH_STORAGE_BASE, BACKGROUND_IMAGE_SIZE);

	//Make an additional copy in SDRAM to make it easier to blit back parts of the original background
	memcpy(BACKGROUND_COPY_BASE, FLASH_STORAGE_BASE, BACKGROUND_IMAGE_SIZE);
	return 0;
}

void GHGraphics_init( void )
{
	if(initPixelBuffer() != 0) printf("Failed to initialize pixel buffer.");
}

void GHGraphics_swapBuffers( void )
{
	//Swap the buffers
	alt_up_pixel_buffer_swap_buffers(pixelBuffer);

	//Wait for the hardware to tell us that it's done
	while(alt_up_pixel_buffer_check_swap_buffers_status(pixelBuffer));

	//It's worth noting here that the original hardware for Altera UP Pixel Buffer has a critical flaw
	//which breaks double buffering (it results in the buffers going out sync between the software and
	//hardware and the software drawing on the front buffer while in fact thinking it's drawing on the back buffer).
	//To fix the issue, a change has to be made in pixel_buffer.v at line 288. The condition inside the if statement
	//needs be changed to "pixel_address_in == ((PIXELS_IN * LINES_IN)  - 1)" in order to match the condition
	//on line 275.
}

//Blit a rectangular area of the original background back to the buffer.
void GHGraphics_blitBackground(int destX, int destY, int destHeight, int destWidth)
{
	register unsigned int destAddr = pixelBuffer->back_buffer_start_address;;
	register unsigned int sourceAddr = BACKGROUND_COPY_BASE;
	register unsigned int limit_x = pixelBuffer->x_resolution;
	register unsigned int l_x = destX; //Left boundary
	register unsigned int r_x = destX + destWidth; //Right boundary
	register unsigned int t_y = destY; //Top boundary
	register unsigned int b_y = destY + destHeight; //Bottom boundary
	register unsigned int x,y;

	//We're using 16 bit color so every pixel occupies 2 bytes
	limit_x = limit_x << 1;
	r_x = r_x << 1;
	l_x = l_x << 1;

	//Go the start of the region
	destAddr = destAddr + t_y * limit_x;
	sourceAddr = sourceAddr + t_y * limit_x;

	//Copy the region line by line
	for (y = t_y; y < b_y; y++)
	{
		//Byte by byte
		for (x = l_x; x < r_x; x++)
		{
			*((char*)(destAddr + x)) = *((char*)(sourceAddr + x));
		}
		destAddr = destAddr + limit_x;
		sourceAddr = sourceAddr + limit_x;
	}
}

//Blit a region of memory to a region in the pixel buffer. If removedPixels is not null, the original values of the covered pixels are stored there.
//Additionally, we're handling rudimentary transparency by skipping the magenta-colored pixels of the source picture.
void GHGraphics_blitPicture(unsigned int base, unsigned int offset, int destX, int destY, int destHeight, int destWidth, unsigned char* removedPixels)
{
	register unsigned int destAddr = pixelBuffer->back_buffer_start_address;
	register unsigned int sourceAddr = base + offset;
	register unsigned int sourceOffset = 0;
	register unsigned char pixel_b1, pixel_b2;
	register unsigned int destPixel;
	register unsigned int limit_x = pixelBuffer->x_resolution;
	register unsigned int l_x = destX;
	register unsigned int r_x = destX + destWidth;
	register unsigned int t_y = destY;
	register unsigned int b_y = destY + destHeight;
	register unsigned int x,y;

	//We're using 16 bit color so every pixel occupies 2 bytes
	limit_x = limit_x << 1;
	r_x = r_x << 1;
	l_x = l_x << 1;

	//Go the start of the region
	destPixel = 0;
	destAddr = destAddr + t_y * limit_x;

	//Blit the picture line by line
	for (y = t_y; y < b_y; y++)
	{
		//Pixel by pixel
		for (x = l_x; x < r_x; x+=2)
		{
			//Get the constituent bytes of the pixels
			pixel_b1 = *((char*)(sourceAddr + sourceOffset));
			pixel_b2 = *((char*)(sourceAddr + sourceOffset + 1));

			if(!removedPixels)
			{
				//Copy them if the resulting color is not magenta
				if(pixel_b1!=TRANSPARENT_COLOR_B1 || pixel_b2!=TRANSPARENT_COLOR_B2)
				{
					*((char*)(destAddr + x)) = pixel_b1;
					*((char*)(destAddr + x + 1)) = pixel_b2;
				}
			} else  //Remember the covered pixels inside the removedPixels array if a pointer is provided
			{
				if(pixel_b1==TRANSPARENT_COLOR_B1 && pixel_b2==TRANSPARENT_COLOR_B2)
				{
					removedPixels[destPixel++] = TRANSPARENT_COLOR_B1;
					removedPixels[destPixel++] = TRANSPARENT_COLOR_B2;
				} else
				{
					removedPixels[destPixel++] = *((char*)(destAddr + x));
					removedPixels[destPixel++] = *((char*)(destAddr + x + 1));

					*((char*)(destAddr + x)) = pixel_b1;
					*((char*)(destAddr + x + 1)) = pixel_b2;
				}
			}
			sourceOffset+=2;
		}
		destAddr = destAddr + limit_x;
	}
}

//Draw a single pixel across both buffers, returning its previous color
unsigned int GHGraphics_setPixel(int x, int y, int color)
{
	register unsigned int oldPixel;
	register unsigned int offset = (x << 1) + y*(pixelBuffer->x_resolution<<1);

	oldPixel = IORD_16DIRECT(pixelBuffer->buffer_start_address, offset);
	IOWR_16DIRECT(pixelBuffer->back_buffer_start_address, offset, color);
	IOWR_16DIRECT(pixelBuffer->buffer_start_address, offset, color);
	return oldPixel;
}

//Perform an additive or subtractive blending. The address of the pixel is given as the offset in memory from the beginning of the pixel buffer.
//If we're trying to blend back to the background, the method takes care of keeping us from exceeding the original color.
void GHGraphics_blendPixelConsecutive(unsigned int offset, unsigned int color, char subtract, char blendBack)
{
	register unsigned int pixel, originalColor;
	register char red, green, blue;
	register char originalRed, originalGreen, originalBlue;
	pixel = IORD_16DIRECT(pixelBuffer->buffer_start_address, offset); //Get the current pixel color

	//We're blending back to the original background so the original color of the destination pixel will serve as the boundary for color change
	if(blendBack)
	{
		originalColor = IORD_16DIRECT(BACKGROUND_COPY_BASE, offset);
		originalRed = (originalColor >> 11) & 0x1F;
		originalGreen = (originalColor >> 5) & 0x3F;
		originalBlue = (originalColor) & 0x1F;
	}

	if(subtract==0) //We're performing additive blending
	{
		//Add the color component by component
		red = ((pixel >> 11) & 0x1F) + ((color >> 11) & 0x1F);
		green = ((pixel >> 5) & 0x3F) + ((color >> 5) & 0x3F);
		blue = (pixel & 0x1F) + (color & 0x1F);
		//If we're blending back to the background check against exceeding the boundaries
		if(blendBack)
		{
			if(red > 0x1F || red >= originalRed) red = originalRed;
			if(green > 0x3F || green >= originalGreen) green = originalGreen;
			if(blue > 0x1F || blue >= originalBlue) blue = originalBlue;
		} else //Otherwise just check against overflowing the range.
		{
			if(red > 0x1F || red <= 0) red = 0x1F;
			if(green > 0x3F || green <= 0) green = 0x3F;
			if(blue > 0x1F || blue <= 0) blue = 0x1F;
		}
	} else //We're performing subtractive blending
	{
		//So we're doing the same thing with reversed signs
		red = ((pixel >> 11) & 0x1F) - ((color >> 5) & 0x1F);
		green = ((pixel >> 5) & 0x3F) - ((color >> 5) & 0x3F);
		blue = (pixel & 0x1F) - (color & 0x1F);
		if(blendBack)
		{
			if(red >= 0x1F || red <= originalRed) red = originalRed;
			if(green >= 0x3F || green <= originalGreen) green = originalGreen;
			if(blue >= 0x1F || blue <= originalBlue) blue = originalBlue;
		} else {
			if(red >= 0x1F || red <= 0) red = 0;
			if(green >= 0x3F || green <= 0) green = 0;
			if(blue >= 0x1F || blue <= 0) blue = 0;
		}
	}

	//Recompose the pixel
	pixel = (red << 11) + (green <<5) + (blue & 0x1F);


	//Write it to both buffers
	IOWR_16DIRECT(pixelBuffer->back_buffer_start_address, offset, pixel);
	IOWR_16DIRECT(pixelBuffer->buffer_start_address, offset, pixel);
}

//Translate x,y screen coordinates into a memory offset based at the start of the pixel buffer
inline unsigned int GHGraphics_getPixelOffset(int x, int y)
{
	return (x << 1) + y*(pixelBuffer->x_resolution<<1);
}

//Draw a solid line of a specified color
void GHGraphics_drawLine(int x0, int y0, int x1, int y1, unsigned int color)
{
	register unsigned int x, y, xMax, yMax;
	register int distX, distY;
	register int distanceBuffer = 0;
	register unsigned int addr = pixelBuffer->back_buffer_start_address;
	register unsigned int i = 0;
	register int sign = 1;
	register unsigned int limit_x = pixelBuffer->x_resolution << 1; //Shifts for 16bit color


	//Rearrange the starting and ending coordinates to always draw lines from left to right to make the algorithm simpler.
	if(x0<=x1 && y0 <= y1) //From left-down to right-up
	{
		x = x0 << 1;
		xMax = x1 << 1;
		distX = x1 - x0;
		y = y0;
		yMax = y1;
		distY = y1 - y0;
		sign = 1;
	} else if(x0>=x1 && y0>=y1) //From right-up to left-down
	{
		x = x1 << 1;
		xMax = x0 << 1;
		distX = x0 - x1;
		y=y1;
		yMax = y0;
		distY = y0 - y1;
		sign = 1;
	} else if(x0<=x1 && y0>=y1) //From left-up to right-down
	{
		x = x0 << 1;
		xMax = x1 << 1;
		distX = x1 - x0;
		y = y0;
		yMax = y1;
		distY = y1 - y0;
		sign = -1;
	} else //From right-up to left-down
	{
		x = x1 << 1;
		xMax = x0 << 1;
		distX = x0 - x1;
		y = y1;
		yMax = y0;
		distY = y0 - y1;
		sign = -1;
	}

	addr = addr + x + y*limit_x;

	if(sign == 1) //We'll be drawing from left-down to right-up
	{
		distanceBuffer = distX;
		while(y <= yMax && x <= xMax)
		{
			IOWR_16DIRECT(addr, 0, color);
			if(distanceBuffer < distY) //move up
			{
				distanceBuffer += distX;
				addr += limit_x;
				y++;
			} else //move right
			{
				distanceBuffer -= distY;
				addr += 2;
				x+=2;
			}
		}
	} else //We'll be drawing from left-up to right-down
	{
		distanceBuffer = -distX;
		while(y >= yMax && x <= xMax)
		{
			IOWR_16DIRECT(addr, 0, color);
			if(distanceBuffer > distY) //move down
			{
				distanceBuffer -= distX;
				addr -= limit_x;
				y--;
			} else //move right
			{
				distanceBuffer -= distY;
				addr += 2;
				x+=2;
			}
		}
	}
}

//Due to premature optimization, this is a copy of the function above specialized for restoring the original background
//Instead of drawing a solid colored line, we're copying the corresponding pixels along a line from a copy of the original background
void GHGraphics_blitLine(int x0, int y0, int x1, int y1)
{
	register unsigned int x, y, xMax, yMax;
	register int distX, distY;
	register int distanceBuffer = 0;
	register unsigned int addr = pixelBuffer->back_buffer_start_address;
	register unsigned int addrBG = BACKGROUND_COPY_BASE;
	register unsigned int i = 0;
	register int sign = 1;
	register unsigned int limit_x = pixelBuffer->x_resolution << 1; //Shifts for 16bit color

	if(x0<=x1 && y0 <= y1)
	{
		x = x0 << 1;
		xMax = x1 << 1;
		distX = x1 - x0;
		y = y0;
		yMax = y1;
		distY = y1 - y0;
		sign = 1;
	} else if(x0>=x1 && y0>=y1)
	{
		x = x1 << 1;
		xMax = x0 << 1;
		distX = x0 - x1;
		y=y1;
		yMax = y0;
		distY = y0 - y1;
		sign = 1;
	} else if(x0<=x1 && y0>=y1) //Leftup, rightdown
	{
		x = x0 << 1;
		xMax = x1 << 1;
		distX = x1 - x0;
		y = y0;
		yMax = y1;
		distY = y1 - y0;
		sign = -1;
	} else
	{
		x = x1 << 1;
		xMax = x0 << 1;
		distX = x0 - x1;
		y = y1;
		yMax = y0;
		distY = y0 - y1;
		sign = -1;
	}

	addr = addr + x + y*limit_x;
	addrBG = addrBG + x + y*limit_x;
	if(sign == 1)
	{
		distanceBuffer = distX;
		while(y <= yMax && x <= xMax)
		{
			IOWR_16DIRECT(addr, 0, *(unsigned int *)addrBG);
			if(distanceBuffer < distY) // move down
			{
				distanceBuffer += distX;
				addr += limit_x;
				addrBG += limit_x;
				y++;
			} else //move right
			{
				distanceBuffer -= distY;
				addr += 2;
				addrBG += 2;
				x+=2;
			}
		}
	} else
	{
		distanceBuffer -= distX;
		while(y >= yMax && x <= xMax)
		{
			IOWR_16DIRECT(addr, 0, *(unsigned int *)addrBG);
			if(distanceBuffer > distY) // move up
			{
				distanceBuffer -= distX;
				addr -= limit_x;
				addrBG -= limit_x;
				y--;
			} else //move right
			{
				distanceBuffer -= distY;
				addr += 2;
				addrBG += 2;
				x+=2;
			}
		}
	}
}
