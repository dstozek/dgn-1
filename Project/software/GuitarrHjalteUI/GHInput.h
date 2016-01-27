/*
 * GHInput.h
 *
 *  Created on: 2010-05-09
 *      Author: Tomasz Kaczmarczyk
 */

#ifndef GHINPUT_H_
#define GHINPUT_H_

	#define GHINPUT_UP 1
	#define GHINPUT_DOWN 2
	#define GHINPUT_LEFT 4
	#define GHINPUT_RIGHT 8

	#define GHINPUT_INC 16
	#define GHINPUT_DEC 32

	#define GHINPUT_GRAPH_0 64
	#define GHINPUT_GRAPH_1 128
	#define GHINPUT_GRAPH_2 256
	#define GHINPUT_GRAPH_3 512
	#define GHINPUT_GRAPH_4 1024
	#define GHINPUT_GRAPH_5 2048

	struct sGHInputData
	{
		unsigned int keys;
		unsigned int mouseX, mouseY;
		unsigned int deltaMouseX, deltaMouseY;
	};

	typedef struct sGHInputData GHInputData;

	void GHInput_init( void );
	GHInputData GHInput_consume( void );

#endif /* INPUT_H_ */
