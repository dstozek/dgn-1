/*
 * GHInput.c
 *
 * The user interacts with the system using a standard PS/2 keyboard. The PS/2 hardware is
 * handled using the Altera University Program PS/2 core.
 * This file provides a wrapper and a debouncer for the keyboard. It translates physical
 * keypresses into predefined constants understandable by the remaining modules of the system.
 * It also implements dynamic debouncing - when a user keeps the key pressed for a longer period
 * of time, this module indicates a keypress event first at the moment the key is pressed and then
 * again and again at decreasing periods of time.
 * This ultimately results in parameter values changing faster when the user keeps the key pressed
 * for a longer period of time.
 *
 * This module could benefit somewhat from a higher time resolution of the system.
 *
 * NOTE: The Altera UP PS/2 drivers for the core used in DGN-1 are flawed. After rebuilding the BSP
 * it is necessary to go the the BSP project, /drivers/src/altera_up_ps2_keyboard.c, line 163 and
 * change the call from alt_up_ps2_read_data_byte to alt_up_ps2_read_data_byte_timeout. Otherwise
 * the driver will discard multi-byte makecodes.
 *
 *  Created on: 2010-05-09
 *      Author: Tomasz Kaczmarczyk
 */

#include "GHInput.h"
#include "GHTime.h"

#include <altera_up_avalon_PS2.h>
#include <altera_up_ps2_keyboard.h>
#include <altera_up_avalon_ps2_regs.h>

#include <sys/alt_irq.h>
#include <stdio.h>

//These two arrays define the relations between the make codes of the keyboard keys and their corresponding internal encoding
//(see for eg. http://www.computer-engineering.org/ps2keyboard/scancodes2.html )
//The up, down, left, right controls correspond to the arrow keys; inc, dec to 'a' and 'z'; and generic graph controls to functional keys F1 to F6
#define INPUTS_NUM 12
alt_u8 make_codes[INPUTS_NUM] = {0x75, 0x6B, 0x72, 0x74, 0x1C, 0x1A, 0x05, 0x06, 0x04, 0x0C, 0x03, 0x0B};
unsigned int controls[INPUTS_NUM] = {GHINPUT_UP, GHINPUT_LEFT, GHINPUT_DOWN, GHINPUT_RIGHT, GHINPUT_INC, GHINPUT_DEC, GHINPUT_GRAPH_0, GHINPUT_GRAPH_1, GHINPUT_GRAPH_2, GHINPUT_GRAPH_3, GHINPUT_GRAPH_4, GHINPUT_GRAPH_5};

//Debouncing configuration. If the key is pressed and held, the input module fires the keypress event
//once when the key is initially pressed, then again after BASE timer ticks, then again after
//BASE-CHANGE ticks, again after BASE-2*CHANGE ticks and so on until it reaches MIN interval length.
#define GHINPUT_BOUNCE_FREQUENCY_NAVIGATION_BASE 50
#define GHINPUT_BOUNCE_FREQUENCY_NAVIGATION_CHANGE 0
#define GHINPUT_BOUNCE_FREQUENCY_NAVIGATION_MIN 10
#define GHINPUT_BOUNCE_FREQUENCY_INCDEC_BASE 10
#define GHINPUT_BOUNCE_FREQUENCY_INCDEC_CHANGE 2
#define GHINPUT_BOUNCE_FREQUENCY_INCDEC_MIN 1

GHInputData inputData;
alt_up_ps2_dev *keyboard;

//Structure used for storing the current state of the debouncing
typedef struct
{
	int offset;
	int span;
	int key;
	int freqBase, freqChange, freqMin;
}  FrequencyCounter;

static FrequencyCounter frequencyCounters[INPUTS_NUM];

//To avoid polling the keyboard unnecessarily we're just handling key-press interrupts
static void readInterrupt(void *context, alt_u32 id)
{
	KB_CODE_TYPE decode_mode;
	alt_u8 buf;
	char ascii;
	int i;
	//Get key pressed
	if (decode_scancode(keyboard, &decode_mode, &buf, &ascii)==0)
	{
		//Check if it corresponds to any of the control keys
		for(i = 0; i < INPUTS_NUM; i++) if(buf==make_codes[i])
		{
			//Remember the raw state for later processing
			if(decode_mode == KB_ASCII_MAKE_CODE || decode_mode==KB_BINARY_MAKE_CODE || decode_mode == KB_LONG_BINARY_MAKE_CODE) inputData.keys |= controls[i]; //Pressed
			else inputData.keys &= ~controls[i]; //Released
		}
	}
}

void GHInput_init( void )
{
	int* dummy;
	int i;

	//Initialize the keyboard drivers
	keyboard = alt_up_ps2_open_dev(PS2_NAME);
	keyboard->timeout = 30000; //Empirically established to work properly
	alt_up_ps2_clear_fifo(keyboard);
	alt_up_ps2_init(keyboard);

	//Hook up the interrupt handler
	keyboard->irq_id = PS2_IRQ;
	alt_up_ps2_enable_read_interrupt(keyboard);
	if(alt_irq_register(PS2_IRQ, dummy, readInterrupt))
			printf("Couldn't register interrupt\n");

	//Initialize the frequency counters for later use in the debouncing
	for(i=0; i<4; i++) //arrows
	{
		frequencyCounters[i].key = controls[i];
		frequencyCounters[i].span = 0;
		frequencyCounters[i].offset = 0;
		frequencyCounters[i].freqBase = GHINPUT_BOUNCE_FREQUENCY_NAVIGATION_BASE;
		frequencyCounters[i].freqChange = GHINPUT_BOUNCE_FREQUENCY_NAVIGATION_CHANGE;
		frequencyCounters[i].freqMin = GHINPUT_BOUNCE_FREQUENCY_NAVIGATION_MIN;
	}
	for(i=4; i<6; i++) //az
	{
		frequencyCounters[i].key = controls[i];
		frequencyCounters[i].span = 0;
		frequencyCounters[i].offset = 0;
		frequencyCounters[i].freqBase = GHINPUT_BOUNCE_FREQUENCY_INCDEC_BASE;
		frequencyCounters[i].freqChange = GHINPUT_BOUNCE_FREQUENCY_INCDEC_CHANGE;
		frequencyCounters[i].freqMin = GHINPUT_BOUNCE_FREQUENCY_INCDEC_MIN;
	}
	for(i=6; i<INPUTS_NUM; i++) //graphs
	{
		frequencyCounters[i].key = controls[i];
		frequencyCounters[i].span = 0;
		frequencyCounters[i].offset = 0;
		frequencyCounters[i].freqBase = GHINPUT_BOUNCE_FREQUENCY_NAVIGATION_BASE;
		frequencyCounters[i].freqChange = GHINPUT_BOUNCE_FREQUENCY_NAVIGATION_CHANGE;
		frequencyCounters[i].freqMin = GHINPUT_BOUNCE_FREQUENCY_NAVIGATION_MIN;
	}
}

//We process the raw state and apply debouncing
GHInputData GHInput_consume( void )
{
	GHInputData data;
	data.keys = 0;
	unsigned long time = GHTime_current();

	//Iterate over all the debouncing counters. If a key corresponding to the counter is held pressed,
	//process the counter and set an appropriate flag in the processed input data
	int i;
	FrequencyCounter *freqCounter;
	for(i=0; i<INPUTS_NUM; i++)
	{
		freqCounter = &frequencyCounters[i];
		if(inputData.keys & freqCounter->key) //The key corresponding to the counter is pressed
		{
			if(freqCounter->span == 0) //It's the intial key-press so fire the event
			{
				freqCounter->span = freqCounter->freqBase; //start counting down the BASE interval
				freqCounter->offset = time % freqCounter->span;
				data.keys |= freqCounter->key;
			} else if(freqCounter->offset == (time % freqCounter->span)) //The key's been pressed for long enough so fire again
			{
				freqCounter->span -= freqCounter->freqChange; //decrease the interval
				if(freqCounter->span < freqCounter->freqMin) freqCounter->span = freqCounter->freqMin;
				freqCounter->offset = time % freqCounter->span;
				data.keys |= freqCounter->key;
			}
		} else freqCounter->span = 0; //The key's not pressed, reset the counter
	}

	//Pass on the processed data.
	return data;
}

