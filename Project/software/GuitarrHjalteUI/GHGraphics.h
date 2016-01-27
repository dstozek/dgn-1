/*
 * GHGraphics.h
 *
 *  Created on: 2010-05-09
 *      Author: Tomasz Kaczmarczyk
 */

#ifndef GHGRAPHICS_H_
#define GHGRAPHICS_H_
	#define BACKGROUND_IMAGE_SIZE 614400
	#define FLASH_STORAGE_BASE 0x800000
	#define BACKGROUND_COPY_BASE_OFFSET 0x00760000
	#define BACKGROUND_COPY_BASE (SDRAM_BASE + BACKGROUND_COPY_BASE_OFFSET)
	#define TRANSPARENT_COLOR_B1 0x1F
	#define TRANSPARENT_COLOR_B2 0xF8
	void GHGraphics_init( void );
	void GHGraphics_swapBuffers( void );
	void GHGraphics_blitPicture(unsigned int base, unsigned int offset, int destX, int destY, int destHeight, int destWidth, unsigned char* removedPixels);
	void GHGraphics_blitBackground(int destX, int destY, int destHeight, int destWidth);

	void GHGraphics_drawLine(int x0, int y0, int x1, int y1, unsigned int color);
	void GHGraphics_blitLine(int x0, int y0, int x1, int y1);


	void GHGraphics_blendPixelConsecutive(unsigned int offset, unsigned int color, char subtract, char blendBack);
	inline unsigned int GHGraphics_getPixelOffset(int x, int y);
	unsigned int GHGraphics_setPixel(int x, int y, int color);
	//unsigned int GHGraphics_blendPixelXY(int x, int y, unsigned int color, char subtract);
#endif /* GHGRAPHICS_H_ */


