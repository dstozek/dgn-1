#ifndef __ALT_SIM_H__
#define __ALT_SIM_H__

/******************************************************************************
*                                                                             *
* License Agreement                                                           *
*                                                                             *
* Copyright (c) 2007      Altera Corporation, San Jose, California, USA.      *
* All rights reserved.                                                        *
*                                                                             *
* Permission is hereby granted, free of charge, to any person obtaining a     *
* copy of this software and associated documentation files (the "Software"),  *
* to deal in the Software without restriction, including without limitation   *
* the rights to use, copy, modify, merge, publish, distribute, sublicense,    *
* and/or sell copies of the Software, and to permit persons to whom the       *
* Software is furnished to do so, subject to the following conditions:        *
*                                                                             *
* The above copyright notice and this permission notice shall be included in  *
* all copies or substantial portions of the Software.                         *
*                                                                             *
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  *
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,    *
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE *
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER      *
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING     *
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER         *
* DEALINGS IN THE SOFTWARE.                                                   *
*                                                                             *
* This agreement shall be governed in all respects by the laws of the State   *
* of California and by the laws of the United States of America.              *
*                                                                             *
******************************************************************************/
#include "system.h"

static ALT_ALWAYS_INLINE void alt_sim_halt(int exit_code)
{
  int r2 = exit_code;

#if defined(NIOS2_HAS_DEBUG_STUB) && (defined(ALT_BREAK_ON_EXIT) || defined(ALT_PROVIDE_GMON))

  int r3 = (1 << 2);

#ifdef ALT_PROVIDE_GMON
  extern unsigned int alt_gmon_data[];
  int r4 = (int)alt_gmon_data;
  r3 |= (1 << 4);

#define ALT_GMON_DATA ,"D04"(r4)
#else
#define ALT_GMON_DATA
#endif

  __asm__ volatile ("wrctl ctl6, %0" : : "r"(1), "D02"(r2) );

  __asm__ volatile ("\n0:\n\taddi %0,%0, -1\n\tbgt %0,zero,0b" : : "r" (ALT_CPU_FREQ/100) ); /* Delay for >30ms */

  __asm__ volatile ("break 2" : : "D02"(r2), "D03"(r3) ALT_GMON_DATA );

#else

  __asm__ volatile ("wrctl ctl6, %0" : : "r"(1), "D02"(r2) );

#endif
}

#define ALT_SIM_HALT(exit_code) \
  alt_sim_halt(exit_code)

#endif /* __ALT_SIM_H__ */
