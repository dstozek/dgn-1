/**
 * GHCreateEffects.c
 *
 * Initializes all the parameters, sets up the widgets and lays them out.
 * The comments in the createDistortion function explain the various fields you can set up.
 */

#include "GHEffectViews.h"
#include "list.h"
#include "stdlib.h"
#include <stdio.h>
#include <io.h>
#include <system.h>
#include <math.h>

static float _tremoloDepth = -1;
static float _tremoloRate = -1;

static void createDistortion(LinkedList* effectParams) {
	GHEffectParamView* p;

	/*
	 * GAIN
	 */
	p = GHEffectViews_newEffectParam(0, 0, 1, 0); //Create a parameter with a knob and no other indicator
	p->controller->type = GHPARAM_FRACTIONAL;
	p->controller->minValue = 0;
	p->controller->maxValue = 1280;
	p->controller->value = 660;
	p->controller->pioBase = PIO_OVERDRIVE_GAIN_BASE; //Setup the corresponding PIO
	GHEffects_sendAttribute(p->controller); //Send the default value

	p->knob->x = 45; //The center of the knob
	p->knob->y = 179;
	//The dial indicating the current position of the knob will be drawn starting from 6px from the center up to 13px from the center
	p->knob->innerRadius = 6;
	p->knob->outerRadius = 13;
	p->knob->color = 0xEEEE; //Will be grayish in color
	// The grid indicates the relative layout of widgets with respect to each other
	// It starts in the top-left corner. It means that parameters with gridX=22 is on the right of parameter
	// with gridX=2. Similarly, gridY=10 is higher than gridY=12.
	// The grid can contain gaps - there may be parameters with gridX=1, gridX=100 and nothing in-between.
	// The particular convention we use here is that the tens digit indicates the position of the effect
	// on the rack (row and column), and the ones digit indicates the position of the widget inside the effect.
	p->gridX = 0;
	p->gridY = 10;
	//The point at which the cursor will be pointing when this parameter is selected
	p->cursorX = 30;
	p->cursorY = 179;
	list_add(effectParams, p);

	/*
	 * TONE
	 */
	p = GHEffectViews_newEffectParam(0, 0, 1, 0);
	p->controller->type = GHPARAM_FRACTIONAL;
	p->controller->minValue = 0;
	p->controller->maxValue = (1<<16)-1;
	p->controller->value = (1<<16)-1;
	p->controller->pioBase = PIO_OVERDRIVE_TONE_BASE;
	GHEffects_sendAttribute(p->controller);
	p->knob->x = 86;
	p->knob->y = 179;
	p->knob->outerRadius = 13;
	p->knob->innerRadius = 0;
	p->knob->color = 0xEEEE;
	p->gridX = 1;
	p->gridY = 10;
	p->cursorX = 71;
	p->cursorY = 179;
	list_add(effectParams, p);

	/*
	 * VOLUME
	 */
	p = GHEffectViews_newEffectParam(0, 0, 1, 0);
	p->controller->type = GHPARAM_FRACTIONAL;
	p->controller->minValue = 0;
	p->controller->maxValue = 1280;
	p->controller->value = 32;
	p->controller->pioBase = PIO_OVERDRIVE_VOLUME_BASE;
	GHEffects_sendAttribute(p->controller);
	p->knob->x = 125;
	p->knob->y = 179;
	p->knob->outerRadius = 13;
	p->knob->innerRadius = 0;
	p->knob->color = 0xEEEE;
	p->gridX = 2;
	p->gridY = 10;
	p->cursorX = 110;
	p->cursorY = 179;
	list_add(effectParams, p);

	/*
	 * ASYMMETRIC
	 */
	p = GHEffectViews_newEffectParam(0, 0, 0, 1);
	p->controller->type = GHPARAM_BOOLEAN;
	p->controller->pioBase = PIO_OVERDRIVE_ASYMMETRIC_BASE;
	GHEffects_sendAttribute(p->controller);
	p->button->x = 187;
	p->button->y = 160;
	p->button->width = 18;
	p->button->height = 30;
	//When the state of the button is changed, an image at this particular location in FLASH memory will be blitted over it.
	p->button->imageFlashMemoryOffset = 0x96002;
	p->gridX = 3;
	p->gridY = 10;
	p->cursorX = 150;
	p->cursorY = 179;
	list_add(effectParams, p);

	/*
	 * BYPASS
	 */
	p = GHEffectViews_newEffectParam(0, 0, 0, 1);
	p->controller->type = GHPARAM_BOOLEAN;
	p->controller->pioBase = PIO_OVERDRIVE_BYPASS_BASE;
	p->controller->value = 1;
	GHEffects_sendAttribute(p->controller);
	p->button->x = 255;
	p->button->y = 158;
	p->button->width = 18;
	p->button->height = 32;
	p->button->imageFlashMemoryOffset = 0x09643C;
	p->gridX = 4;
	p->gridY = 10;
	p->cursorX = 209;
	p->cursorY = 179;
	list_add(effectParams, p);
}

//Tremolo(panner) effect has its parameters precalculated here in software.
//The user only takes care of choosing the depth and rate of the trembling,
//whereas the hardware receives calculated slope parameters.
static void tremoloSendParams() {
	float slope, diff, best_diff;
	float actualRate;
	unsigned int a, b, j, k, depth;
	if (_tremoloDepth < 0 || _tremoloRate < 0) return;

	//The actual, ideal slope
	slope = 2 * _tremoloDepth*((1<<16)-1)*_tremoloRate / 48000;

	best_diff = infinityf();

	//The hardware receives the slope of the trembling in the form of a
	//rational number a/b.

	//We find the closest approximation of the actual slope.
	for (k = 1; k<16; k++) {
		j = (int)roundf(slope*k);
		if (j < 1) j = 1;
		if (j > 15) j = 15;
		diff = fabsf( ((float)a/b) - slope);
		if (diff < best_diff) {
			a = j;
			b = k;
			best_diff = diff;
		}
	}

	depth = (int)floorf(_tremoloDepth * ((1<<16)-1));

	IOWR_16DIRECT(PIO_TREMOLO_STEREO_DEPTH_BASE, 0, depth);
	IOWR_16DIRECT(PIO_TREMOLO_STEREO_SWEEP_A_BASE, 0, a);
	IOWR_16DIRECT(PIO_TREMOLO_STEREO_SWEEP_B_BASE, 0, b);
}

static void tremoloSendRate(GHEffectAttribute* rate) {
	_tremoloRate = (float)rate->value / rate->denominator;
	tremoloSendParams();
}

static void tremoloSendDepth(GHEffectAttribute* depth) {
	_tremoloDepth = (float)depth->value / depth->denominator;
	tremoloSendParams();
}

static void createTremolo(LinkedList* effectParams) {
	GHEffectParamView* p;
	/*
	 * BYPASS
	 */
	p = GHEffectViews_newEffectParam(0, 1, 0, 0);
	p->controller->type = GHPARAM_BOOLEAN;
	p->controller->pioBase = PIO_TREMOLO_STEREO_BYPASS_BASE;
	p->controller->value = 1;
	GHEffects_sendAttribute(p->controller);
	p->valueShard->x = 49;
	p->valueShard->y = 22;
	p->gridX = 10;
	p->gridY = 10;
	p->cursorX = 338;
	p->cursorY = 178;
	list_add(effectParams, p);

	/*
	 * DEPTH
	 */
	p = GHEffectViews_newEffectParam(0, 1, 0, 0);
	p->controller->type = GHPARAM_FRACTIONAL;
	//When the parameter changes this handler function is called instead of the default implementation which just writes the current value to PIO
	p->controller->sendAttribute = tremoloSendDepth;
	GHEffects_sendAttribute(p->controller);
	p->controller->minValue = 0;
	p->controller->value = 6500;
	p->controller->maxValue = (1<<16)-1;
	p->controller->denominator = (1<<16)-1;
	p->valueShard->x = 49;
	p->valueShard->y = 24;
	p->gridX = 10;
	p->gridY = 11;
	p->cursorX = 345;
	p->cursorY = 194;
	list_add(effectParams, p);

	/*
	 * RATE
	 */
	p = GHEffectViews_newEffectParam(0, 1, 0, 0);
	p->controller->type = GHPARAM_FRACTIONAL;
	p->controller->sendAttribute = tremoloSendRate;
	GHEffects_sendAttribute(p->controller);
	p->controller->minValue = 0;
	p->controller->value = 6500;
	p->controller->denominator = 6500;
	p->controller->maxValue = 21*p->controller->denominator;

	p->valueShard->x = 58;
	p->valueShard->y = 22;
	p->gridX = 11;
	p->gridY = 10;
	p->cursorX = 457;
	p->cursorY = 178;
	list_add(effectParams, p);

	/*
	 * MODE
	 */
	p = GHEffectViews_newEffectParam(0, 1, 0, 0);
	p->controller->type = GHPARAM_BOOLEAN;
	p->controller->pioBase = PIO_TREMOLO_STEREO_MODE_BASE;
	GHEffects_sendAttribute(p->controller);
	p->controller->minValue = 0;
	p->controller->value = 0;
	p->controller->maxValue = 1;
	p->controller->denominator = 1;
	p->valueShard->x = 58;
	p->valueShard->y = 24;
	p->gridX = 11;
	p->gridY = 11;
	p->cursorX = 457;
	p->cursorY = 198;
	list_add(effectParams, p);
}

static void createCompressor(LinkedList* effectParams) {
	GHEffectParamView* p;
	/*
	 * BYPASS
	 */
	p = GHEffectViews_newEffectParam(0, 0, 0, 1);
	p->controller->type = GHPARAM_BOOLEAN;
	p->controller->pioBase = PIO_COMPRESSOR_BYPASS_BASE;
	GHEffects_sendAttribute(p->controller);
	p->button->x = 262;
	p->button->y = 239;
	p->button->width = 34;
	p->button->height = 43;
	p->button->imageFlashMemoryOffset = 0x96DCE;
	p->button->invertState = 1;
	p->gridX = 2;
	p->gridY = 20;
	p->cursorX = 258;
	p->cursorY = 261;
	list_add(effectParams, p);

	/*
	 * GAIN
	 */
	p = GHEffectViews_newEffectParam(0, 0, 1, 0);
	p->controller->type = GHPARAM_FRACTIONAL;
	p->controller->minValue = 0;
	p->controller->maxValue = 255;
	p->controller->value = 100;
	p->controller->pioBase = PIO_COMPRESSOR_GAIN_BASE;
	GHEffects_sendAttribute(p->controller);
	p->knob->x = 147;
	p->knob->y = 261;
	p->knob->outerRadius = 16;
	p->knob->innerRadius = 8;
	p->knob->color = 0xEEEE;
	p->gridX = 0;
	p->gridY = 20;
	p->cursorX = 128;
	p->cursorY = 261;
	list_add(effectParams, p);

	/*
	 * THRESHOLD
	 */
	p = GHEffectViews_newEffectParam(0, 0, 1, 0);
	p->controller->type = GHPARAM_FRACTIONAL;
	p->controller->minValue = 0;
	p->controller->maxValue = 255;
	p->controller->value = 100;
	p->controller->pioBase = PIO_COMPRESSOR_TRESHOLD_BASE;
	GHEffects_sendAttribute(p->controller);
	p->knob->x = 212;
	p->knob->y = 261;
	p->knob->outerRadius = 16;
	p->knob->innerRadius = 8;
	p->knob->color = 0xEEEE;
	p->gridX = 1;
	p->gridY = 20;
	p->cursorX = 194;
	p->cursorY = 261;
	list_add(effectParams, p);
}

static void createDelay(LinkedList* effectParams) {
	GHEffectParamView* p;
	/*
	 * BYPASS
	 */
	p = GHEffectViews_newEffectParam(0, 0, 0, 1);
	p->controller->type = GHPARAM_BOOLEAN;
	p->controller->pioBase = PIO_DELAY_BYPASS_BASE;
	p->controller->value = 1;
	GHEffects_sendAttribute(p->controller);
	p->button->x = 372;
	p->button->y = 247;
	p->button->width = 18;
	p->button->height = 19;
	p->button->imageFlashMemoryOffset = 0x96B20;
	p->button->invertState = 1;
	p->gridX = 10;
	p->gridY = 20;
	p->cursorX = 372;
	p->cursorY = 254;
	list_add(effectParams, p);

	/*
	 * DELAY TIME
	 */
	p = GHEffectViews_newEffectParam(0, 0, 1, 0);
	p->controller->type = GHPARAM_FRACTIONAL;
	p->controller->minValue = 0;
	p->controller->maxValue = 2000;
	p->controller->value = 400;
	p->controller->pioBase = PIO_DELAY_LENGTH_BASE;
	GHEffects_sendAttribute(p->controller);
	p->knob->x = 525;
	p->knob->y = 254;
	p->knob->outerRadius = 9;
	p->knob->innerRadius = 0;
	p->knob->color = 0x1111;
	p->gridX = 11;
	p->gridY = 20;
	p->cursorX = 506;
	p->cursorY = 254;
	list_add(effectParams, p);

	/*
	 * DELAY FEEDBACK
	 */
	p = GHEffectViews_newEffectParam(0, 0, 1, 0);
	p->controller->type = GHPARAM_FRACTIONAL;
	p->controller->minValue = 0;
	p->controller->maxValue = 255;
	p->controller->value = 100;
	p->controller->pioBase = PIO_DELAY_DECAY_BASE;
	GHEffects_sendAttribute(p->controller);
	p->knob->x = 580;
	p->knob->y = 254;
	p->knob->outerRadius = 9;
	p->knob->innerRadius = 0;
	p->knob->color = 0x1111;
	p->gridX = 12;
	p->gridY = 20;
	p->cursorX = 561;
	p->cursorY = 254;
	list_add(effectParams, p);
}

static void createOctaver(LinkedList* effectParams) {
	GHEffectParamView* p;
	/*
	 * BYPASS
	 */
	p = GHEffectViews_newEffectParam(0, 0, 0, 1);
	p->controller->type = GHPARAM_BOOLEAN;
	p->controller->pioBase = PIO_OCTAVER_BYPASS_BASE;
	p->controller->value = 1;
	GHEffects_sendAttribute(p->controller);
	p->button->x = 196;
	p->button->y = 326;
	p->button->width = 16;
	p->button->height = 19;
	p->button->imageFlashMemoryOffset = 0x968BE;
	p->gridX = 1;
	p->gridY = 30;
	p->cursorX = 194;
	p->cursorY = 334;
	list_add(effectParams, p);

	/*
	 * DRY WET
	 */
	p = GHEffectViews_newEffectParam(0, 0, 1, 0);
	p->controller->type = GHPARAM_FRACTIONAL;
	p->controller->minValue = 0;
	p->controller->maxValue = (1<<16)-1;
	p->controller->value = (1<<15);
	p->controller->pioBase = PIO_OCTAVER_DRY_WET_BASE;
	GHEffects_sendAttribute(p->controller);
	p->knob->x = 162;
	p->knob->y = 337;
	p->knob->outerRadius = 10;
	p->knob->innerRadius = 2;
	p->knob->color = 0x1111;
	p->gridX = 0;
	p->gridY = 30;
	p->cursorX = 148;
	p->cursorY = 334;
	list_add(effectParams, p);
}

static void createBitCrusher(LinkedList* effectParams) {
	GHEffectParamView* p;
	/*
	 * BYPASS
	 */
	p = GHEffectViews_newEffectParam(1, 1, 0, 0);
	p->controller->type = GHPARAM_BOOLEAN;
	p->controller->pioBase = PIO_BITCRUSHER_BYPASS_BASE;
	p->controller->value = 1;
	GHEffects_sendAttribute(p->controller);
	p->nameShard->x = 61;
	p->nameShard->y = 40;
	p->nameShard->value = "Bypass";
	p->valueShard->x = 68;
	p->valueShard->y = 40;
	p->gridX = 10;
	p->gridY = 30;
	p->cursorX = 480;
	p->cursorY = 324;
	list_add(effectParams, p);

	/*
	 * DRY WET
	 */
	p = GHEffectViews_newEffectParam(1, 1, 0, 0);
	p->controller->type = GHPARAM_FRACTIONAL;
	p->controller->pioBase = PIO_BITCRUSHER_DRYWET_BASE;
	p->controller->minValue = 0;
	p->controller->value = (1<<15);
	p->controller->maxValue = (1<<16)-1;
	p->controller->denominator = (1<<16)-1;
	GHEffects_sendAttribute(p->controller);
	p->nameShard->x = 61;
	p->nameShard->y = 41;
	p->nameShard->value = "DryWet";
	p->valueShard->x = 68;
	p->valueShard->y = 41;
	p->gridX = 10;
	p->gridY = 31;
	p->cursorX = 480;
	p->cursorY = 332;
	list_add(effectParams, p);

	/*
	 * TONE
	 */
	p = GHEffectViews_newEffectParam(1, 1, 0, 0);
	p->controller->type = GHPARAM_FRACTIONAL;
	p->controller->pioBase = PIO_BITCRUSHER_TONE_BASE;
	p->controller->minValue = 0;
	p->controller->value = (1<<15);
	p->controller->maxValue = (1<<16)-1;
	p->controller->denominator = (1<<16)-1;
	GHEffects_sendAttribute(p->controller);
	p->nameShard->x = 61;
	p->nameShard->y = 42;
	p->nameShard->value = "Tone";
	p->valueShard->x = 68;
	p->valueShard->y = 42;
	p->gridX = 10;
	p->gridY = 32;
	p->cursorX = 480;
	p->cursorY = 340;
	list_add(effectParams, p);

	/*
	 * FLAVOR
	 */
	p = GHEffectViews_newEffectParam(1, 1, 0, 0);
	p->controller->type = GHPARAM_DISCRETE;
	p->controller->pioBase = PIO_BITCRUSHER_FLAVOR_BASE;
	p->controller->minValue = 0;
	p->controller->value = 0;
	p->controller->maxValue = 1;
	GHEffects_sendAttribute(p->controller);
	p->nameShard->x = 61;
	p->nameShard->y = 43;
	p->nameShard->value = "Flavor";
	p->valueShard->x = 68;
	p->valueShard->y = 43;
	p->gridX = 10;
	p->gridY = 33;
	p->cursorX = 480;
	p->cursorY = 348;
	list_add(effectParams, p);
}

static void createMaster(LinkedList* effectParams) {
	GHEffectParamView* p;
	/*
	 * VOLUME
	 */
	p = GHEffectViews_newEffectParam(0, 0, 1, 0);
	p->controller->type = GHPARAM_FRACTIONAL;
	p->controller->minValue = 0;
	p->controller->maxValue = 2048;
	p->controller->value = 255;
	p->controller->pioBase = PIO_MASTER_VOLUME_BASE;
	GHEffects_sendAttribute(p->controller);
	p->knob->x = 116;
	p->knob->y = 429;
	p->knob->outerRadius = 26;
	p->knob->innerRadius = 16;
	p->knob->color = 0xEEEE;
	p->gridX = 0;
	p->gridY = 40;
	p->cursorX = 83;
	p->cursorY = 429;
	list_add(effectParams, p);
}

void GHEffectViews_createEffects(LinkedList* effectParams) {

	createDistortion(effectParams);
	createTremolo(effectParams);
	createCompressor(effectParams);
	createDelay(effectParams);
	createOctaver(effectParams);
	createBitCrusher(effectParams);
	createMaster(effectParams);
}
