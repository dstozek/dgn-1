/*
 * GHCursor.c
 *
 * The animated cursor used for indicating the currently selected parameter
 *
 *  Created on: 2010-06-01
 *      Author: Tomasz Kaczmarczyk
 */

#include "GHGraphics.h"
#include <system.h>

//The parameters of the cursor image
//It's size
#define GHCURSOR_WIDTH 28
#define GHCURSOR_HEIGHT 16
//And placement in memories
#define GHCURSOR_FLASH_OFFSET 0x9793C
#define GHCURSOR_SDRAM_OFFSET 0x00755000

#define GHCURSOR_MINSPEED 1

static int curX, curY; //Current coordinates of the cursor
static int nextX, nextY; //The destination coordinates
static int lastX, lastY; //The coordinates during last frame
static int wiggleX, wiggleY; //The cursor moves around its coords in little circles

static char moving;
static char firstFrame;
static unsigned char* removedPixels;
static unsigned char* lastRemovedPixels;

void GHCursor_init()
{
	nextX = nextY = 300;
	wiggleX = wiggleY = 0;
	curX = curY = 300;
	removedPixels = malloc((GHCURSOR_WIDTH*GHCURSOR_HEIGHT)*2); //2 bytes per pixel
	lastRemovedPixels = malloc((GHCURSOR_WIDTH*GHCURSOR_HEIGHT)*2);
	firstFrame = 2;
	memcpy(SDRAM_BASE + GHCURSOR_SDRAM_OFFSET, FLASH_STORAGE_BASE + GHCURSOR_FLASH_OFFSET, (GHCURSOR_WIDTH*GHCURSOR_HEIGHT)*2);
}

void GHCursor_update()
{
	//Recover whatever background was covered by the cursor
	if(!firstFrame) GHGraphics_blitPicture(0, lastRemovedPixels, lastX, lastY, GHCURSOR_HEIGHT, GHCURSOR_WIDTH, 0);
	else firstFrame--;

	lastX = curX + wiggleX;
	lastY = curY + wiggleY;

	//If we're on our way from one widget to the other, we need to recalculate the coords of the cursor
	if(moving)
	{
		float distX = nextX - curX;
		float distY = nextY - curY;
		float dist = sqrt(distX*distX + distY*distY);
		if(dist < GHCURSOR_MINSPEED)
		{
			curX = nextX;
			curY = nextY;
			moving = 0;
		} else
		{
			float speed = GHCURSOR_MINSPEED + dist/5.0f;
			curX += speed * distX/dist;
			curY += speed * distY/dist;
		}
	}
	//Wiggle around a bit.
	float arg = (float)GHTime_current()/4.0f;
	wiggleX = 2.0f*sin(arg);
	wiggleY = 2.0f*cos(arg);

	//We need to remember removed pixels for two frames due to double buffering
	unsigned char* temp = lastRemovedPixels;
	lastRemovedPixels = removedPixels;
	removedPixels = temp;

	//Draw the cursor
	GHGraphics_blitPicture(SDRAM_BASE, GHCURSOR_SDRAM_OFFSET, curX+wiggleX, curY+wiggleY, GHCURSOR_HEIGHT, GHCURSOR_WIDTH, removedPixels);
}

//Set the new destination so that the cursor is pointing at the specified coords.
void GHCursor_setLocation(int x, int y)
{
	nextX = x - GHCURSOR_WIDTH;
	nextY = y - GHCURSOR_HEIGHT/2;
	moving = 1;
}
