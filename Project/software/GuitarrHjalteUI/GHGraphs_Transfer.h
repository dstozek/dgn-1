/*
 * GHGraphs_SignalStrength.h
 *
 *  Created on: 2010-05-21
 *      Author: Tomasz Kaczmarczyk
 */

#ifndef GHGRAPHS_TRANSFER_H_
#define GHGRAPHS_TRANSFER_H_
	#include "GHGraphs.h"

	/*
	 * Returns two graphs - left and right channel
	 */
	GHGraph* GHGraphs_init_Transfer( void );
	void GHGraphs_setTransferScalingX(int shift);
	void GHGraphs_setTransferScalingY(int shift);

#endif /* GHGRAPHS_TRANSFER_H_ */
