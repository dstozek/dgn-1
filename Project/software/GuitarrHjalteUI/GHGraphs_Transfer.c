/*
 * GHGraphs_Transfer.c
 *
 * The sound analyzer module displays plots of the transfer characteristics of the system.
 * It takes pairs of values of the form (input, output) and displays them as pixels in the graph area.
 * Older pixels are faded out as in a classic analog oscilloscope.
 *
 * To increase the sampling rate, the plotter takes bursts of eight pairs of samples per refresh. Special
 * hardware buffers the samples for this cause.
 *
 *  Created on: 2010-05-21
 *      Author: Tomasz Kaczmarczyk
 */

#include "Math.h"
#include "GHGraphs.h"
#include "GHGraphics.h"
#include <system.h>
#include <sys/alt_irq.h>

typedef struct
{
	unsigned int *tracePixelOffsets; //Address offsets of the lit pixels, used to fade them out as they grow older
	unsigned int currentTraceLocation; //At which index in the trace pixel array are we at the moment
	unsigned int traceLength; //How long is the trace pixel array altogether

	unsigned int traceStartColor, traceFadeColor; //The pixels are lit to the starting color and then faded by subtracting the fade color every several generations

	unsigned int *fadingDistances; //The pixels are faded as they grow older, the fading occurs at specified generations
	unsigned int fadingDistanceCount; //The number of fadings specified

	unsigned int zeroX, zeroY; //The center of the plot

	unsigned short* analyzerInput; //The input PIO
} GraphData;

signed int _scalingX, _scalingY;

static void render ( GHGraph* graph )
{
	signed int X, Y;
	int i, fadingIndex, sampleIndex;
	union {
		//The hardware provides us with 8 bits per sample - 16 bits per pair (input and its corresponding output samples)
		unsigned short pair; //16 bits per pair of samples
		signed char coords[2]; //8 bits signed. Range of -128:+127 is more than enough, given the available width and height of the plot is 120x120.
	} data;

	GraphData* d = (GraphData*)graph->data;
	//We operate on bursts of eight sample pairs per iteration.
	for(sampleIndex = 0; sampleIndex < 8; sampleIndex++)
	{
		data.pair = d->analyzerInput[sampleIndex];

		//Handle the scaling if necessary
		if(_scalingX >= 0) X = data.coords[1] << _scalingX;
		else X = data.coords[1] >> (-_scalingX);
		if(_scalingY >= 0) Y = (-data.coords[0]) << _scalingY;
		else Y = (-data.coords[0]) >> (-_scalingY);

		//Constrain the plot to the available screen estate.
		if(X > 64) X = 64;
		if(X < -64) X = -64;
		if(Y > 64) Y = 64;
		if(Y < -64) Y = -64;

		//Offset the point by the coordinates of the point (0,0)
		X += graph->xOffset + d->zeroX;
		Y += graph->yOffset + d->zeroY;

		//Calculate the memory offset corresponding to our screen coordinates
		d->tracePixelOffsets[d->currentTraceLocation] = GHGraphics_getPixelOffset(X, Y);
		//Light the sample.
		GHGraphics_blendPixelConsecutive(d->tracePixelOffsets[d->currentTraceLocation], d->traceStartColor, 1, 0);
		//Fade older pixels where necessary
		for(i=0; i<d->fadingDistanceCount; i++)
		{
			//Calculate the index of the pixel to be faded
			fadingIndex = d->currentTraceLocation + d->fadingDistances[i];
			if(fadingIndex >= d->traceLength) fadingIndex -= d->traceLength;
			//Fade the pixel.
			GHGraphics_blendPixelConsecutive(d->tracePixelOffsets[fadingIndex], d->traceFadeColor, 0, 1);
		}
		//Advance trace location
		d->currentTraceLocation++;
		if(d->currentTraceLocation >= d->traceLength) d->currentTraceLocation = 0;
	}
}

static void setDefaults(GHGraph* graph)
{
	int i;
	graph->render = &render;

	GraphData* graphData = (GraphData*)calloc(sizeof(GraphData), 1);

	//Setup the (0,0) point coordinates
	graphData->zeroX = graphData->zeroY = 60;
	//Setup the length and color of the trace
	graphData->currentTraceLocation = 0;
	graphData->traceLength = 512;
	graphData->traceStartColor = 0xFFFF; //The pixels are lit up as white
	graphData->traceFadeColor = (2 << 11) + (3 << 5) + (2); //Fade away a bit slower in green to compensate for the greenish background of the sound analyzer

	//Currently we're fading at 16 equidistant points throughout the trace, which results in pixels fading linearly.
	//It could give interesting results to introduce some kind of a logarithmic fading - so that the pixels fade fast when young and then
	//linger for a long time when very faint.
	graphData->fadingDistanceCount = 16;
	graphData->fadingDistances = (unsigned int*)calloc(sizeof(unsigned int), graphData->fadingDistanceCount);
	for(i = 0; i < graphData->fadingDistanceCount; i++)
	{
		graphData->fadingDistances[i] = graphData->traceLength/graphData->fadingDistanceCount * i;
	}

	graphData->tracePixelOffsets = (unsigned int*)calloc(sizeof(unsigned int),  graphData->traceLength);

	graph->data = graphData;
}

//Change the scaling of the sound analyzer plotter
void GHGraphs_setTransferScalingX(int shift)
{
	_scalingX = shift;
}

void GHGraphs_setTransferScalingY(int shift)
{
	_scalingY = shift;
}

GHGraph* GHGraphs_init_Transfer( void )
{
	GHGraph* graphs = (GHGraph*)calloc(sizeof(GHGraph), 2);
	GraphData* d;
	_scalingX = 0;
	_scalingY = 0;

	//Init the left and the right channels.

	setDefaults(&graphs[0]);
	setDefaults(&graphs[1]);
	d = (GraphData*)graphs[0].data;
	d->analyzerInput = ANALYZER_INPUT_LEFT_BASE;

	d = (GraphData*)graphs[1].data;
	d->analyzerInput = ANALYZER_INPUT_RIGHT_BASE;

	return graphs;
}
