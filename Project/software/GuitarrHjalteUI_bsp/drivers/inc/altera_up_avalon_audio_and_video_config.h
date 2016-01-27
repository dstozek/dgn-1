#ifndef __ALTERA_UP_AVALON_AUDIO_AND_VIDEO_CONFIG_H__
#define __ALTERA_UP_AVALON_AUDIO_AND_VIDEO_CONFIG_H__

#include <stddef.h>
#include <alt_types.h>
#include <sys/alt_dev.h>

#include "altera_up_avalon_audio_and_video_config_regs.h"

#ifdef __cplusplus
extern "C"
{
#endif /* __cplusplus */

///////////////////////////////////////////////////////////////////////////////
// 

typedef enum {
	/// @brief Configuration is for on-board audio only.
	AUDIO_CONFIG = 0,
	/// @brief Configuration is for both the on-board audio and video.
	ON_BOARD_AV_CONFIG = 1,
	/// @brief Configuration is for the DC2 camera.
	DC2_CONFIG = 2,
	/// @brief Configuration is for the LCM .
	LCM_CONFIG = 3
} CONFIG_DEVICE_TYPE;

//////////////////////////////////////////////////////////////////////////
// 
/*
 * Device structure definition. Each instance of the driver uses one
 * of these structures to hold its associated state.
 */
typedef struct alt_up_av_config_dev {
	/// @brief character mode device structure .
	/// @sa Developing Device Drivers for the HAL in Nios II Software Developer's Handbook.
	alt_dev dev;
	/// @brief the base address of the device.
	unsigned int base;
	/// @brief the configuration device type
	CONFIG_DEVICE_TYPE type;
	/// @brief the counter threshold for timeout in acknowledgment.
	int timeout;
} alt_up_av_config_dev;

//////////////////////////////////////////////////////////////////////////
// HAL system functions

//////////////////////////////////////////////////////////////////////////
// direct operation functions

/*
 * Macros used by alt_sys_init 
 */
#define ALTERA_UP_AVALON_AUDIO_AND_VIDEO_CONFIG_INSTANCE(name, device)	\
  static alt_up_av_config_dev device =		\
  {                                                 	\
    {                                               	\
      ALT_LLIST_ENTRY,                              	\
      name##_NAME,                                  	\
      NULL , /* open */		\
      NULL , /* close */		\
      NULL , /* read */		\
      NULL , /* write */		\
      NULL , /* lseek */		\
      NULL , /* fstat */		\
      NULL , /* ioctl */		\
    },                                              	\
    name##_BASE,                                		\
    0,  /* device type */             	\
    100              /* default timeout value */ 		\
  }

#define ALTERA_UP_AVALON_AUDIO_AND_VIDEO_CONFIG_INIT(name, device) \
{	\
    alt_dev_reg(&device.dev);                          	\
}

/**
 * @brief Open the Audio/Video Configuration device specified by <em> name </em>.
 *
 * @param name -- the Audio/Video Configuration component name in SOPC Builder. 
 *
 * @return The corresponding device structure, or NULL if the device is not found.
 **/
alt_up_av_config_dev* alt_up_av_config_open_dev(const char* name);


/**
 * @brief Write configuration data to the on-board audio device register.
 *
 * @param av_config -- the device structure 
 * @param addr -- the register address.
 * @param data -- the data to be written.
 *
 * @note The \e av_config structure should represent a component that does
 * on-board audio configuration only, otherwise an error will occur.
 *
 * @return 0 for success or a negated error code for failure due to timeout in acknowledgment.
 **/
int alt_up_av_config_send_audio_cfg(alt_up_av_config_dev *av_config, alt_u32 addr, alt_u32 data);

/**
 * @brief Write configuration data to the on-board video device register.
 *
 * @param av_config -- the device structure 
 * @param addr -- the register address.
 * @param data -- the data to be written.
 *
 * @note The \e av_config structure should represent a component that does
 * both on-board audio and video configuration, otherwise an error will occur.
 *
 * @return 0 for success or a negated error code for failure due to timeout in acknowledgment.
 **/
int alt_up_av_config_send_video_cfg(alt_up_av_config_dev *av_config, alt_u32 addr, alt_u32 data);

/**
 * @brief Write configuration data to the LCM device register.
 *
 * @param av_config -- the device structure 
 * @param addr -- the register address.
 * @param data -- the data to be written.
 *
 * @note The \e av_config structure should represent a component that does
 * LCM configuration, otherwise an error will occur.
 *
 * @return 0 for success or a negated error code for failure due to timeout in acknowledgment.
 **/
int alt_up_av_config_send_LCM_cfg(alt_up_av_config_dev *av_config, alt_u32 addr, alt_u32 data);

/**
 * @brief Write configuration data to the DC2 device register.
 *
 * @param av_config -- the device structure 
 * @param addr -- the register address. 
 * @param data -- the data to be written.
 *
 * @note The \e av_config structure should represent a component that does
 * DC2 camera configuration, otherwise an error will occur.
 *
 * @return 0 for success or a negated error code for failure due to timeout in acknowledgment.
 **/
int alt_up_av_config_send_DC2_cfg(alt_up_av_config_dev *av_config, alt_u32 addr, alt_u32 data);


#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* __ALTERA_UP_AVALON_AUDIO_AND_VIDEO_CONFIG_H__ */


