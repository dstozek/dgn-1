/*
 * GHTextShards.h
 *
 *  Created on: 2010-05-09
 *      Author: Tomasz Kaczmarczyk
 */

#ifndef GHTEXTSHARDS_H_
#define GHTEXTSHARDS_H_

	struct sGHTextShard {
		int x, y;
		char* value;
		char emphasis;
	};

	typedef struct sGHTextShard GHTextShard;

	void GHTextShards_init( void );
	void GHTextShards_clearScreen ( void );
	void GHTextShards_display( const GHTextShard** shards, int count);
	void GHTextShards_displaySingle(GHTextShard* shard);
	void GHTextShards_displaySelectionIndicator(int x, int y);
#endif /* GHTEXTSHARDS_H_ */
