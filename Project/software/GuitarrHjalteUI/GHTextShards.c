/*
 * GHTextShards.c
 *
 * Altera UP Character Buffer wrapper. Takes care of initializing the hardware and updating the text rendered on the screen.
 * Text to be rendered is provided in discrete chunks called TextShards containing the coordinates at which to render and the
 * text to display.
 *  Created on: 2010-05-09
 *      Author: Tomasz Kaczmarczyk
 */

#include "GHTextShards.h"
#include <altera_up_avalon_character_buffer.h>
#include <stdio.h>

struct sGHTextShardCoords
{
	int x, y;
};

typedef struct sGHTextShardCoords GHTextShardCoords;

//The earliest versions used to have a text-based interface with static image as the background.
//The animated cursor is a very recent addition. Before it was implemented, the widgets were selected
//by rendering a special cursor character (an arrow) next to them.
static GHTextShardCoords lastSelection;
static char emphasisChar;
static int emphasisCharSpan;

//We're using the Altera UP Character Buffer core.
static alt_up_char_buffer_dev* charBuffer;

static int initCharacterBuffer()
{
	//Initialize the hardware
	charBuffer = alt_up_char_buffer_open_dev("/dev/character_buffer");
	if(charBuffer==NULL) return 1;

	alt_up_char_buffer_init(charBuffer);
	alt_up_char_buffer_clear(charBuffer);
	return 0;
}

void GHTextShards_init( void )
{
	if(initCharacterBuffer() != 0) printf("Failed to initialize character buffer.");
	//These aren't used any more. Have been obsoleted by the animated cursor.
	lastSelection.x = 0;
	lastSelection.y = 0;
	emphasisChar = 26; //Arrow pointing right
	emphasisCharSpan = 1;
}

void GHTextShards_clearScreen ( void )
{
	alt_up_char_buffer_clear(charBuffer);
}

//Display a single TextShard
void GHTextShards_displaySingle(GHTextShard* shard) {
	if (shard)
		alt_up_char_buffer_string(charBuffer, shard->value, shard->x, shard->y);
}

//The text-based selection indicator has been obsoleted by the animated cursor.
void GHTextShards_displaySelectionIndicator(int x, int y)
{
	alt_up_char_buffer_draw(charBuffer, ' ', lastSelection.x, lastSelection.y); //Clear last emphasis
	alt_up_char_buffer_draw(charBuffer, emphasisChar, x, y);
	lastSelection.x = x;
	lastSelection.y = y;
}

//Display a number of shards on the screen
void GHTextShards_display( const GHTextShard** shards, int count)
{
	int i;
	GHTextShard* shard;
	for(i=0; i<count; i++)
	{
		shard = shards[i];
		//The emphasis member was used to decide whether to render a cursor next to the text shard
		if(!shard->emphasis) alt_up_char_buffer_string(charBuffer, shard->value, shard->x, shard->y);
		else
		{
			//Before the GUI was implemented, a text-based UI was used and an arrow character was renedered to indicate
			//parameter selection. It is now obsolete and can be safely removed.
			if(lastSelection.x != shard->x-emphasisCharSpan || lastSelection.y != shard->y)
				alt_up_char_buffer_draw(charBuffer, ' ', lastSelection.x, lastSelection.y); //Clear last emphasis
			lastSelection.x = shard->x-emphasisCharSpan;
			lastSelection.y = shard->y;
			alt_up_char_buffer_draw(charBuffer, emphasisChar, lastSelection.x, lastSelection.y);
			alt_up_char_buffer_string(charBuffer, shard->value, shard->x, shard->y);
		}
	}
}
