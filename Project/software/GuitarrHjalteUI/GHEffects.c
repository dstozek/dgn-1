/*
 * GHEffects.c
 *
 * Effect parameter values are communicated to the hardware via dedicated PIOs.
 * This module handles the default behavior of parameters (simple increasing and decreasing)
 * and selecting the parameters.
 *
 *  Created on: 2010-05-09
 *      Author: Tomasz Kaczmarczyk
 */

#include "GHEffects.h"
#include "GHEffectViews.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <io.h>
#include <system.h>

static GHEffectParamView* selectedParam;

//Write the value to the appropriate PIO or call the assigned custom handler function.
void GHEffects_sendAttribute(GHEffectAttribute* attr)
{
	if(attr->sendAttribute==NULL) IOWR_16DIRECT(attr->pioBase, 0, (unsigned int)attr->value);
	else attr->sendAttribute(attr);
}

//Increase the value of the parameter, taking care of keeping it inside of bounds.
static void increaseAttribute()
{
	int newValue;
	GHEffectAttribute* attr = selectedParam->controller;

	//If we're just a boolean value, we're going no further than 1
	if(attr->type==GHATTRIBUTE_BOOLEAN)
	{
		if(attr->value != 1)
		{
			attr->value = 1;
			selectedParam->invalidated = 1;
			GHEffects_sendAttribute(attr);
		}
	} else
	{
		//Increase the value. 256 values should be enough for everybody
		if (attr->maxValue > 256) {
			newValue = attr->value + ((attr->maxValue) >> 8);
		}
		else {
			newValue = attr->value + 1;
		}
		if(newValue > attr->maxValue) newValue = attr->maxValue;

		//If the new value is different, update it and invalidate the widget.
		if(attr->value != newValue)
		{
			attr->value = newValue;
			selectedParam->invalidated = 1;
			GHEffects_sendAttribute(attr);
		}
	}
}

//Decrease the value of the parameter, taking care of keeping it inside of bounds
static void decreaseAttribute()
{
	int newValue;
	GHEffectAttribute* attr = selectedParam->controller;
	//Booleans go no lower than 0
	if(attr->type==GHATTRIBUTE_BOOLEAN)
	{
		if(attr->value != 0)
		{
			attr->value = 0;
			selectedParam->invalidated = 1;
			GHEffects_sendAttribute(attr);
		}
	} else
	{
		//256 values should be enough for everybody
		if (attr->maxValue > 256) {
			newValue = attr->value - ((attr->maxValue) >> 8);
		}
		else {
			newValue = attr->value - 1;
		}
		if(newValue < attr->minValue) newValue = attr->minValue;

		//Update and invalidate if necessary
		if(attr->value != newValue)
		{
			attr->value = newValue;
			selectedParam->invalidated = 1;
			GHEffects_sendAttribute(attr);
		}
	}
}

//Move left/right in the UI
//Every widget has an assigned grid coordinate which places it relatively to other widgets.
static void moveHorizontal(int step, LinkedList* params)
{
	GHEffectParamView* nextParam = 0;
	GHEffectParamView* candParam; //candidate widget
	int nextDistX, nextDistY;
	int candDistX, candDistY;
	int curGridX = selectedParam->gridX;
	int curGridY = selectedParam->gridY;

	//Iterate over all the parameters looking for  the closest widget in the direction we're trying to move to.
	list_rewind(params);
	while((candParam = list_next(params)))
	{
		if(candParam == selectedParam) continue;
		candDistX = candParam->gridX - curGridX;
		candDistY = candParam->gridY - curGridY;
		if(candDistX == 0 || (step>0 && candDistX<0) || (step<0 && candDistX>0)) continue; //Skip widgets in different directions
		//Check if if it's closer then the last best candidate
		if(!nextParam || abs(candDistY) <= abs(nextDistY))
		{
			if(abs(candDistY) < abs(nextDistY) || abs(candDistX) < abs(nextDistX))
			{
				nextParam = candParam;
				nextDistX = candDistX;
				nextDistY = candDistY;
			}
		}
	}
	//If we've found one, make it our new selection
	if(nextParam)
	{
		selectedParam = nextParam;
		GHEffectViews_changeSelection(selectedParam);
	}
}

//Do the same thing but on the vertical axis
static void moveVertical(int step, LinkedList* params)
{
	GHEffectParamView* nextParam = 0;
	GHEffectParamView* candParam; //candidate effect
	int nextDistX, nextDistY;
	int candDistX, candDistY;
	int curGridX = selectedParam->gridX;
	int curGridY = selectedParam->gridY;

	list_rewind(params);
	while((candParam = list_next(params)))
	{
		if(candParam == selectedParam) continue;
		candDistX = candParam->gridX - curGridX;
		candDistY = candParam->gridY - curGridY;

		if(candDistY == 0 || (step>0 && candDistY<0) ||(step<0 && candDistY>0)) continue;

		if(!nextParam || abs(candDistX) <= abs(nextDistX))
		{
			if(abs(candDistX) < abs(nextDistX) || abs(candDistY) < abs(nextDistY))
			{
				nextParam = candParam;
				nextDistX = candDistX;
				nextDistY = candDistY;
			}
		}

	}

	if(nextParam)
	{
		selectedParam = nextParam;
		GHEffectViews_changeSelection(selectedParam);
	}
}

//Initialization just takes care of selecting the initial parameter
void GHEffects_init( LinkedList* params )
{
	selectedParam = params->first;
}

//React to the user input
void GHEffects_update( GHInputData input, LinkedList* params)
{
	//Move the selection on the horizontal axis
	if(input.keys & GHINPUT_LEFT) moveHorizontal(-1, params);
	else if(input.keys & GHINPUT_RIGHT) moveHorizontal(1, params);

	//On the vertical axis
	if(input.keys & GHINPUT_UP) moveVertical(-1, params);
	else if(input.keys & GHINPUT_DOWN) moveVertical(1, params);

	//Increase or decrease the currently selected parameter
	if(input.keys & GHINPUT_INC) increaseAttribute();
	else if(input.keys & GHINPUT_DEC) decreaseAttribute();
}
