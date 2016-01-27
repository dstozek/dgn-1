/*
 * GHEffectViews.h
 *
 *  Created on: 2010-05-30
 *      Author: Dominik Sto¿ek
 */

#include "GHTextShards.h"
#include "list.h"
#include "GHEffects.h"

#ifndef GHEFFECTVIEWS_H_
#define GHEFFECTVIEWS_H_

typedef enum
{
	GHPARAM_DISCRETE = 0, //If the value shard is specified, the value will be displayed directly as an integer
	GHPARAM_FRACTIONAL = 1, //If the value shard is specified, the value will be displayed as a rational of the form value/denominator
	GHPARAM_BOOLEAN = 2 //If the value shard is specified, the value will be displayed as either "on" or "off"
} GHPARAM_TYPE;

typedef struct {
	int x;	// x of knob center in pixels
	int y; // y of knob center in pixels
	int outerRadius; // outer radius of knob line indicator in pixels
	int innerRadius; // inner radius of knob line indicator in pixels
	float minAngle; // leftmost (minimum) setting on the knob;
	float maxAngle; // rightmost (minimum) setting on the knob;
	unsigned int color;
	int lastLine_x0, lastLine_x1, lastLine_y0, lastLine_y1; //last line coords for clearing
	int curLine_x0, curLine_x1, curLine_y0, curLine_y1; //last line coords for clearing
} GHEffectKnob;

typedef struct {
	int x;	// x of left-upper corner of the button
	int y; // y of left-upper corner of the button
	int width; //width of the image stored as the alternate state of the button
	int height; //height of the image stored as the alternate state of the button
	unsigned int imageFlashMemoryOffset; //off-state is the default background
	char invertState; //if the default background should be treated as the on-state
} GHEffectButton;

typedef struct {
	GHEffectAttribute* controller;

	GHTextShard* nameShard; //The position and value of the piece of text to display as the name of the parameter
	GHTextShard* valueShard; //The position of the piece of text to display as the value of the parameter
	GHEffectKnob* knob; //The configuration of an animated knob used to represent the parameter
	GHEffectButton* button; //The configuration of the button used to represent the parameter


	int cursorX; // the position in pixel where to put the cursor when the parameter is selected
	int cursorY; // the position in pixel where to put the cursor when the parameter is selected

	int gridX; //the relative position of the widget with respect to other widgets on the screen
	int gridY; //the relative position of the widget with respect to other widgets on the screen

	char invalidated; //set to nonzero if redraw is necessary

} GHEffectParamView;

void GHEffectViews_renderEffects(LinkedList* effectParams);
void GHEffectViews_createEffects(LinkedList* effectParams);
void GHEffectViews_changeSelection(GHEffectParamView* selection);
GHEffectParamView* GHEffectViews_newEffectParam(int hasName, int hasValue, int hasKnob, int hasButton);
#endif /* GHEFFECTVIEWS_H_ */
