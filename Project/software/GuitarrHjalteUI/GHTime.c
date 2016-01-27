/*
 * GHTime.c
 *
 *	The simplest possible global time manager. Counts iterations of the main program loop.
 *	Could provide higher time resolution if the counting was rewritten in hardware but that
 *	is not strictly necessary in the system with current workload.
 *
 *  Created on: 2010-05-09
 *      Author: Tomasz Kaczmarczyk
 */

#include "GHTime.h"

unsigned int __GHTime_sysTime;

void GHTime_init( void )
{
	__GHTime_sysTime = 0;
}

void GHTime_advance( void )
{
	__GHTime_sysTime ++;
}

unsigned long GHTime_current( void )
{
	return __GHTime_sysTime;
}
