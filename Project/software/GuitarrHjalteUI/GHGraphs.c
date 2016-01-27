/*
 * GHGraphs.c
 *
 *
 * There are two graph types in the current version of DGN1:
 * The sound analyzer plot - transfer characteristic, which plots the relation between input and output sample values
 * The VU power meters, which display the output volume.
 *
 * Since we're handling stereo sound, we have to display a total of four graphs(one of each of the graph types per channel).
 *
 *  Created on: 2010-05-21
 *      Author: Tomasz Kaczmarczyk
 */
#include "GHGraphs.h"
#include "GHGraphs_SignalStrength.h"
#include "GHGraphs_Transfer.h"
#include "GHGraphics.h"

static GHGraph* graphs[GHGRAPHS_GRAPH_COUNT];

static void renderGraphs()
{
	//Refresh all the graphs
	int i;
 	for(i = 0; i<GHGRAPHS_GRAPH_COUNT; i++)	graphs[i]->render(graphs[i]);
}

void GHGraphs_init( void )
{
	//Initialize VU meters
	GHGraph* signalPowerGraphs = GHGraphs_init_SignalStrength();
	graphs[GHGRAPHS_OUTPUT_POWER_L] = &signalPowerGraphs[0];
	graphs[GHGRAPHS_OUTPUT_POWER_L]->xOffset = 234;
	graphs[GHGRAPHS_OUTPUT_POWER_L]->yOffset = 385;
	graphs[GHGRAPHS_OUTPUT_POWER_R] = &signalPowerGraphs[1];
	graphs[GHGRAPHS_OUTPUT_POWER_R]->xOffset = 327;
	graphs[GHGRAPHS_OUTPUT_POWER_R]->yOffset = 385;

	//Initialize sound analyzer
	GHGraph* transferGraphs = GHGraphs_init_Transfer();
	graphs[GHGRAPHS_TRANSFER_L] = &transferGraphs[0];
	graphs[GHGRAPHS_TRANSFER_L]->xOffset = 33;
	graphs[GHGRAPHS_TRANSFER_L]->yOffset = 9;
	graphs[GHGRAPHS_TRANSFER_R] = &transferGraphs[1];
	graphs[GHGRAPHS_TRANSFER_R]->xOffset = 172;
	graphs[GHGRAPHS_TRANSFER_R]->yOffset = 9;

}

void GHGraphs_update( GHInputData input )
{
	//Allow the user to adjust the scaling on the sound analyzer plot
	//Added for debug purposes and could benefit from rewriting.
 	if(input.keys & GHINPUT_GRAPH_0) GHGraphs_setTransferScalingX(0);
	if(input.keys & GHINPUT_GRAPH_1) GHGraphs_setTransferScalingX(1);
	if(input.keys & GHINPUT_GRAPH_2) GHGraphs_setTransferScalingX(-1);
	if(input.keys & GHINPUT_GRAPH_3) GHGraphs_setTransferScalingY(0);
	if(input.keys & GHINPUT_GRAPH_4) GHGraphs_setTransferScalingY(1);
	if(input.keys & GHINPUT_GRAPH_5) GHGraphs_setTransferScalingY(-1);

	//Refresh all the grpahs
	renderGraphs();
}
