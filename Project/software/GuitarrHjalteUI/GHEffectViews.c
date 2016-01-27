/*
 * GHEffectViews.c
 *
 * Parameters of the effects are represented on the user interface by widgets. It can be
 * either a knob, a button or a text display. A single widget can affect multiple parameters
 * (or conversely, a single parameter can be affected by multiple widgets) but the default
 * is a one-to-one relation.
 *
 *  Created on: 2010-05-24
 *      Author: Dominik Sto¿ek
 */

#include "GHEffectViews.h"
#include "GHTextShards.h"
#include "GHGraphics.h"
#include "list.h"
#include "system.h"

static GHEffectParamView* lastSelection;

//Format the text to display for a text-based widget for parameter value
//A text-based value widget can be one of three modes : discrete, which
//displays the unsigned integer value of the attribute; fractional, which
//displays it as a fixed point fractional value; and boolean which displays
//"on" and "off".
static void formatParamTextValue(char* dest, GHEffectAttribute* attr)
{
		switch(attr->type)
		{
			case GHPARAM_DISCRETE:
				sprintf(dest, "%4d", attr->value);
			break;
			case GHPARAM_BOOLEAN:
				sprintf(dest, "%s", (attr->value ? "on " : "off"));
			break;
			case GHPARAM_FRACTIONAL:
				sprintf(dest, "%.2f", (float)attr->value/(float)attr->denominator);
			break;
		}
}

//The knobs are rendered as static images with a dynamically overlayed lines indicating current value.
static void renderKnob(GHEffectParamView *param)
{
	GHEffectKnob* knob = param->knob;
	//Recover the background from under the last drawn line
	GHGraphics_blitLine(knob->lastLine_x0, knob->lastLine_y0, knob->lastLine_x1, knob->lastLine_y1);

	knob->lastLine_x0 = knob->curLine_x0;
	knob->lastLine_y0 = knob->curLine_y0;
	knob->lastLine_x1 = knob->curLine_x1;
	knob->lastLine_y1 = knob->curLine_y1;

	if(param->invalidated == 1) //invalidated this frame, need to recalculate the line
	{
		float currentValue = (float)param->controller->value/(float)param->controller->maxValue;
		float arg = currentValue*(knob->maxAngle-knob->minAngle)+knob->minAngle;

		float sinVal = sin(arg);
		float cosVal = cos(arg);

		knob->curLine_x0 = knob->x + knob->innerRadius*sinVal;
		knob->curLine_x1 = knob->x + knob->outerRadius*sinVal;
		knob->curLine_y0 = knob->y - knob->innerRadius*cosVal;
		knob->curLine_y1 = knob->y - knob->outerRadius*cosVal;
	}

	//Draw the indicator
	GHGraphics_drawLine(knob->curLine_x0, knob->curLine_y0, knob->curLine_x1, knob->curLine_y1, knob->color);
}

//Buttons are rendered by blitting graphics corresponding to the appropriate state of the button (on or off)
static void renderButton(GHEffectParamView *param)
{
	GHEffectButton* button = param->button;

	if((param->controller->value && !button->invertState) || (!param->controller->value && button->invertState) ) GHGraphics_blitPicture(FLASH_STORAGE_BASE, button->imageFlashMemoryOffset, button->x, button->y, button->height, button->width, 0);
	else GHGraphics_blitBackground(button->x, button->y, button->height, button->width);
}

//Update all the widgets
void GHEffectViews_renderEffects(LinkedList* effectParams) {
	GHEffectParamView* param;
	list_rewind(effectParams);

	//List over all the parameters.
	while((param = list_next(effectParams))) {
		//Knobs need to be repainted every time. Otherwise the animated cursor would erase the position indicators.
		if (param->knob)
		{
			renderKnob(param);
		}

		//If the parameter value hasn't changed, we can carry on
		if (!param->invalidated) continue;

		//Display text-based widgets if they are defined
		if (param->nameShard) {
			GHTextShards_displaySingle(param->nameShard);
		}
		if (param->valueShard) {
			formatParamTextValue(param->valueShard->value, param->controller);
			GHTextShards_displaySingle(param->valueShard);
		}

		//Display button if it is defined
		if(param->button) {
			renderButton(param);
		}

		//invalidated is set to 1 when the value of a parameter changes. The update then needs to happen twice in a row in order to fill both buffers.
		if(param->invalidated==2) param->invalidated = 0;
		else param->invalidated = 2;
	}
}

//Change the currently selected widget
void GHEffectViews_changeSelection(GHEffectParamView* selection) {
	GHCursor_setLocation(selection->cursorX, selection->cursorY);
}


//Create a new effect with memory allocated for the specified widgets
GHEffectParamView* GHEffectViews_newEffectParam(int hasName, int hasValue, int hasKnob, int hasButton) {
	GHEffectParamView* p;
	p = malloc(sizeof(GHEffectParamView));
	if (!p)	return 0;

	if (hasName) {
		p->nameShard = malloc(sizeof(GHTextShard));
		if (!p->nameShard) {
			return 0;
		}
		p->nameShard->x = 0;
		p->nameShard->y = 0;

	} else {
		p->nameShard = 0;
	}

	if (hasValue) {
		p->valueShard = malloc(sizeof(GHTextShard));
		if (!p->valueShard) {
			return 0;
		}
		p->valueShard->x = 0;
		p->valueShard->y = 0;
		p->valueShard->value = malloc(5*sizeof(char));

	} else {
		p->valueShard = 0;
	}

	if (hasKnob) {
		p->knob = malloc(sizeof(GHEffectKnob));
		if (!p->knob) {
			return 0;
		}
		p->knob->color = 0xFFFF;
		p->knob->x = 0;
		p->knob->y = 0;
		p->knob->outerRadius = 10;
		p->knob->innerRadius = 0;
		p->knob->minAngle = -2.5;
		p->knob->maxAngle = 2.5;
		p->knob->lastLine_x0 = p->knob->lastLine_x1 = p->knob->lastLine_y0 =p->knob->lastLine_y1 = 0;
		p->knob->curLine_x0 = p->knob->curLine_x1 = p->knob->curLine_y0 =p->knob->curLine_y1 = 0;
	} else {
		p->knob = 0;
	}

	if(hasButton) {
		p->button = malloc(sizeof(GHEffectButton));
		if (!p->button) {
			return 0;
		}
		p->button->x = p->button->y = p->button->width = p->button->height = p->button->imageFlashMemoryOffset = p->button->invertState = 0;
	} else {
		p->button = 0;
	}

	p->controller = malloc(sizeof(GHEffectAttribute));
	if (!p->controller) return 0;

	p->controller->value = 0;
	p->controller->denominator = 1;
	p->controller->minValue = 0;
	p->controller->maxValue = 1;
	p->controller->pioBase = 0;
	p->controller->type = GHPARAM_BOOLEAN;
	p->controller->sendAttribute = 0;
	p->cursorX = 0;
	p->cursorY = 0;
	p->gridX = 0;
	p->gridY = 0;
	p->invalidated = 1;

	return p;
}

