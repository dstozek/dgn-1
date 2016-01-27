/*
 * GHGraphs_SignalStrength.c
 *
 * The VU meters are drawn as a static background with a dial overlayed. Its input is
 * provided by a hardware averaging module which estimates the current output power of
 * the system.
 *
 *
 *
 *  Created on: 2010-05-21
 *      Author: Tomasz Kaczmarczyk
 */

#include "Math.h"
#include "GHGraphs.h"
#include <system.h>

typedef struct
{
	//We store the coordinates of all the segments of the dial for two iterations.
	//This is necessary when we're reblitting (recovering) the pixels covered by the dial
	//in order to restore the background.

	int endX, endY; //The end point of the dial
	int lastEndX, lastEndY;

	int baseX, baseY; //The base point of the dial
	int lastBaseX, lastBaseY;

	int tipStartX, tipStartY; //The point where the red-colored tip starts
	int lastTipStartX, lastTipStartY;

	//If we had just started rendering then there is no need to reblit the background since it hasn't been covered yet
	int justStartedRendering;

	unsigned int *pio;
} GraphData;

static int _indicatorBaseX, _indicatorBaseY; //The coordinates (with regards to the top-left corner of the meter) of the base point of the dial
//The length of the dial, of the tip and how much of the dial should be left unrendered (when it is covered by a protruding part of the meter near the base)
static unsigned int _indicatorLength, _indicatorTipLength, _indicatorBaseOffset;
//The range in which the dial should move
static float _angleMin, _angleMax;

static void render ( GHGraph* graph )
{
	GraphData* d = (GraphData*) graph->data;

	//If we haven't just started rendering we should cleanup the background before we draw a new dial
	//We blit background pixels back in the places where we had covered them with the old dial
	if(!d->justStartedRendering)
	{
		GHGraphics_blitLine(d->lastBaseX, d->lastBaseY, d->lastTipStartX, d->lastTipStartY);
		GHGraphics_blitLine(d->lastTipStartX, d->lastTipStartY, d->lastEndX, d->lastEndY);
	}
	d->justStartedRendering = 0;

	//Calculate the angle at which we should draw the dial
	float currentValue = log10(10.0f+(float)*(d->pio)/100.0f) - 1.0f;
	float arg = currentValue*(_angleMax-_angleMin)+_angleMin;

	float sinVal = sin(arg);
	float cosVal = cos(arg);

	//Remember last coordinates for reblitting next iteration
	d->lastEndX = d->endX;
	d->lastEndY = d->endY;
	d->lastBaseX = d->baseX;
	d->lastBaseY = d->baseY;
	d->lastTipStartX = d->tipStartX;
	d->lastTipStartY = d->tipStartY;

	//Calculate the new coordinates: the start of the visible part of the dial, the start of the red tip and the end of the dial.
	d->baseX = _indicatorBaseX + graph->xOffset + sinVal*_indicatorBaseOffset;
	d->baseY = _indicatorBaseY + graph->yOffset - cosVal*_indicatorBaseOffset;
	d->tipStartX = d->baseX + sinVal*_indicatorLength;
	d->tipStartY = d->baseY - cosVal*_indicatorLength;
	d->endX = d->baseX + sinVal*(_indicatorLength+_indicatorTipLength);
	d->endY = d->baseY - cosVal*(_indicatorLength+_indicatorTipLength);

	//Draw the dial
	GHGraphics_drawLine(d->baseX, d->baseY, d->tipStartX, d->tipStartY, 0);
	//Draw the tip
	GHGraphics_drawLine(d->tipStartX, d->tipStartY, d->endX, d->endY, 31<<11);
}

//Not much to setup in here.
static void setup(GHGraph* graph)
{
	graph->render = &render;

	GraphData* graphData = (GraphData*)calloc(sizeof(GraphData), 1);
	graphData->justStartedRendering = 1;
	graph->data = graphData;
}

GHGraph* GHGraphs_init_SignalStrength( void )
{
	//Setup the values dependent on the face of the VU meter that we use
	_indicatorBaseX = 40;
	_indicatorBaseY = 60;
	_indicatorLength = 27;
	_indicatorTipLength = 5;
	_indicatorBaseOffset = 0;
	_angleMin = -1.04;
	_angleMax = 1.04;

	//Setup the PIOs
	GHGraph* graphs = (GHGraph*)calloc(sizeof(GHGraph), 2);
	GraphData* d;
	setup(&graphs[0]);
	d = (GraphData*)graphs[0].data;
	d->pio = PIO_OUTPUT_POWER_LEFT_BASE;

	setup(&graphs[1]);
	d = (GraphData*)graphs[1].data;
	d->pio = PIO_OUTPUT_POWER_RIGHT_BASE;


	return graphs;
}
