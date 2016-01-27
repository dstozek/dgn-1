/******************************************************************************
*                                                                             *
* License Agreement                                                           *
*                                                                             *
* Copyright (c) 2006 Altera Corporation, San Jose, California, USA.           *
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

#include <errno.h>

#include <priv/alt_file.h>
#include <alt_types.h>

#include "altera_up_avalon_audio_and_video_config.h"
#include "altera_up_avalon_audio_and_video_config_regs.h"

alt_up_av_config_dev* alt_up_av_config_open_dev(const char* name)
{
  // find the device from the device list 
  // (see altera_hal/HAL/inc/priv/alt_file.h 
  // and altera_hal/HAL/src/alt_find_dev.c 
  // for details)
  alt_up_av_config_dev *dev = (alt_up_av_config_dev*)alt_find_dev(name, &alt_dev_list);
  dev->type = (IORD_ALT_UP_AV_CONFIG_CONTROL(dev->base) >> ALT_UP_AV_CONFIG_CONTROL_CFG_TYPE_OFST) & ALT_UP_AV_CONFIG_CONTROL_CFG_TYPE_MSK;

  return dev;
}


/* 
 * ****************************************************************************
 * Generic functions wrappers to access the registers of the Audio/Video Config
 * Core
 * ****************************************************************************
 */
void alt_up_av_config_write_control_reg(alt_up_av_config_dev *av_config, alt_u32 data) 
{
	// use mask to ensure the reserved bits are written 0
	IOWR_ALT_UP_AV_CONFIG_CONTROL(av_config->base, data & ALT_UP_AV_CONFIG_CONTROL_VALID_MSK );
}

void alt_up_av_config_write_address_reg(alt_up_av_config_dev *av_config, alt_u32 addr)
{
	// use mask to ensure the reserved bits are written 0
	IOWR_ALT_UP_AV_CONFIG_ADDRESS(av_config->base, addr & ALT_UP_AV_CONFIG_ADDRESS_VALID_MSK); 
}

void alt_up_av_config_write_data_reg(alt_up_av_config_dev *av_config, alt_u32 data)
{
	// use mask to ensure the reserved bits are written 0
	IOWR_ALT_UP_AV_CONFIG_DATA(av_config->base, data & ALT_UP_AV_CONFIG_DATA_VALID_MSK); 
}

alt_u32 alt_up_av_config_read_data_reg(alt_up_av_config_dev *av_config)
{
	return IORD_ALT_UP_AV_CONFIG_DATA(av_config->base); 
}

alt_u32 alt_up_av_config_read_status_reg(alt_up_av_config_dev *av_config)
{
	return IORD_ALT_UP_AV_CONFIG_STATUS(av_config->base); 
}

int wait_for_ack(alt_up_av_config_dev *av_config)
{
	alt_u32 status;
	int timeout = av_config->timeout;
	do{
		status = alt_up_av_config_read_status_reg(av_config);
		timeout--;
	} while ( ((status & ALT_UP_AV_CONFIG_STATUS_ACK_MSK)!=0) & timeout);

	if (timeout <= 0)
		return -ETIMEDOUT;
	else
		return 0;
}

/**
 * @brief Send data to the device
 *
 * @param av_config -- the device data structure 
 * @param addr -- the address of the destination device register 
 * @param data --  the data to be sent
 *
 * @return 0 for success or negated error code for failure due to timeout in acknowledgment 
 **/
int alt_up_av_config_send_data(alt_up_av_config_dev *av_config, alt_u8 addr, alt_u8 data)
{
	int ack;
	// set the start bit in Control register
	alt_up_av_config_write_control_reg(av_config, ALT_UP_AV_CONFIG_CONTROL_START_MSK);
	// check acknowledge is 0
	if ((ack = wait_for_ack(av_config))!=0)
		return ack;

	// send device register address
	alt_up_av_config_write_address_reg(av_config, addr);
	// check acknowledge is 0
	if ((ack = wait_for_ack(av_config))!=0)
		return ack;

	// read/write data
	alt_up_av_config_write_data_reg(av_config, data);
	// check acknowledge is 0
	if ((ack = wait_for_ack(av_config))!=0)
		return ack;

	// set the stop bit
	alt_up_av_config_write_control_reg(av_config, ALT_UP_AV_CONFIG_CONTROL_STOP_MSK);
	return 0;
}

int alt_up_av_config_send_audio_cfg(alt_up_av_config_dev *av_config, alt_u32 addr, alt_u32 data)
{
	if (av_config->type != ON_BOARD_AV_CONFIG && av_config->type != AUDIO_CONFIG)
		return -EINVAL;
	// check the device is indeed audio configuration
	// for audio , the address is acutally 7 bits and data is 9 bits, so we need to re-organize a little bit
	// --> we will put the data[9] to be sent with the address (at the LSB)
	alt_u8 new_addr = ((addr & 0xFF)<<1) | ((data & 0x100)>>8);
	alt_u8 new_data = (data & 0xFF);
	return alt_up_av_config_send_data(av_config, new_addr, new_data);
}

int alt_up_av_config_send_video_cfg(alt_up_av_config_dev *av_config, alt_u32 addr, alt_u32 data)
{
	if (av_config->type != ON_BOARD_AV_CONFIG)
		return -EINVAL;

	// the base of the video is 4 words higher (from word 4 to 7)
	av_config->base = av_config->base + 4;
	int ret = alt_up_av_config_send_data(av_config, (addr & 0xFF), (data & 0xFF));
	// set the base back to normal
	av_config->base = av_config->base - 4;
	return ret;
}

int alt_up_av_config_send_LCM_cfg(alt_up_av_config_dev *av_config, alt_u32 addr, alt_u32 data)
{
	if (av_config->type != LCM_CONFIG)
		return -EINVAL;
	return alt_up_av_config_send_data(av_config, (addr & 0xFF), (data & 0xFF));
}

int alt_up_av_config_send_DC2_cfg(alt_up_av_config_dev *av_config, alt_u32 addr, alt_u32 data)
{
	if (av_config->type != DC2_CONFIG)
		return -EINVAL;
	// send the upper byte
	int ret = alt_up_av_config_send_data(av_config, addr & 0xFF, (data>>8) & 0xFF);
	if (ret==0)
		// send the lower byte
		return alt_up_av_config_send_data(av_config, addr & 0xFF, data & 0xFF);
	else
		return ret;
}

