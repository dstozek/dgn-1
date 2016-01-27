/*
 * GHGraphs.h
 *
 *  Created on: 2010-05-21
 *      Author: Tomasz Kaczmarczyk
 */

#ifndef GHGRAPHS_H_
#define GHGRAPHS_H_

#include "GHInput.h"

//struct sGHGraphBackground {
//	unsigned int offsetInFlash;
//	unsigned int width, height, x, y;
//};
//
//typedef struct sGHGraphBackground GHGraphBackground;

struct sGHGraph {
	int xOffset, yOffset;

	void(*render)(struct sGHGraph* graph);
	void* data;
};

typedef struct sGHGraph GHGraph;

void GHGraphs_update( GHInputData input );
void GHGraphs_init( void );

#define GHGRAPHS_GRAPH_COUNT 4
#define GHGRAPHS_OUTPUT_POWER_L 0
#define GHGRAPHS_OUTPUT_POWER_R 1
#define GHGRAPHS_TRANSFER_L 2
#define GHGRAPHS_TRANSFER_R 3

#endif /* GHGRAPHS_H_ */
