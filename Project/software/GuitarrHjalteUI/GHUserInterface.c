/*
 * The software part of DGN-1 is responsible for all user interactions. It
 * displays the GUI, handles user input, generates the sound analyzer plot and
 * takes care of feeding the effect paramaters back to the hardware.
 *
 * It is realized on a single core of NIOS II/f with floating point hardware. It
 * uses a number of available Altera University Program IP Cores to interface
 * with the Altera DE2 hardware.
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "GHTextShards.h"
#include "GHEffects.h"
#include "GHInput.h"
#include "GHTime.h"
#include "GHGraphics.h"
#include "GHGraphs.h"
#include "list.h"


int main()
{
	GHInputData inputs; //The user input from PS/2 keyboard
	LinkedList params; //Effect parameters, each parameter is associate with a widget - a knob, a button etc.

	params.count = 0;
	params.last =  0;
	params.first = 0;
	params.current = 0;

	GHGraphics_init(); //Init the pixel buffer and the graphics module
	GHCursor_init(); //Init the cursor used for selecting different widgets
	GHGraphs_init(); //Init the graphs - the VU meters and sound analyzer plot

	//Init the character buffer for displaying text on the screen
	GHTextShards_init();

	//Setup all the effect parameters, assign default values and determine the way the user can change them
	GHEffectViews_createEffects(&params);
	GHEffects_init(&params);

	//Init the keyboard input handling
	GHInput_init();

	//The time in the system is currently simply an iteration counter.
	//It is used to establish the number of the current iteration of the main loop.
	//Implementing a counter in hardware could be useful for increasing the time resolution
	//of the system but at the current workload this simplest implementation is good enough.
	GHTime_init();

	//Main system loop
	while(1)
	{
		//Get current timestamp - loop iteration number
		GHTime_advance();

		//Handle any input from the keyboard
		inputs = GHInput_consume();

		//Swap pixel buffers (see double buffering on Wikipedia)
		GHGraphics_swapBuffers();

		//Update the UI
		GHGraphs_update(inputs); //The VU graphs and sound analyzer
		GHEffects_update(inputs, &params); //Process user input and update effect parameters
		GHEffectViews_renderEffects(&params, 0); //Update the widgets displaying parameter values
		GHCursor_update(); //Animate the cursor
	}

	return 0;
}
