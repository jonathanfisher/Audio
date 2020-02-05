#ifndef PCM5242_H_
#define PCM5242_H_

#include <stdint.h>
#include <stdbool.h>

#include "stm32f7xx_hal.h"

typedef struct pcm5242_t pcm5242_t;
typedef struct pcm5242_t* pcm5242_handle_t;

#define PCM5242_GPIO1 (1 << 0)
#define PCM5242_GPIO2 (1 << 1)
#define PCM5242_GPIO3 (1 << 2)
#define PCM5242_GPIO4 (1 << 3)
#define PCM5242_GPIO5 (1 << 4)
#define PCM5242_GPIO6 (1 << 5)

typedef enum
{
	PCM5242_GPIO_1 = 0,
	PCM5242_GPIO_2 = 1,
	PCM5242_GPIO_3 = 2,
	PCM5242_GPIO_4 = 3,
	PCM5242_GPIO_5 = 4,
	PCM5242_GPIO_6 = 5,
	PCM5242_GPIO_Count
} PCM5242_GPIO_t;

typedef enum
{
	PCM5242_GpioFunction_Off 				= 0,
	PCM5242_GpioFunction_DSPOutput 			= 1,
	PCM5242_GpioFunction_RegisterOutput 	= 2,
	PCM5242_GpioFunction_AutoMuteBoth 		= 3,
	PCM5242_GpioFunction_AutoMuteLeft 		= 4,
	PCM5242_GpioFunction_AutoMuteRight 		= 5,
	PCM5242_GpioFunction_ClockInvalid 		= 6,
	PCM5242_GpioFunction_SDOUT 				= 7,
	PCM5242_GpioFunction_AnalogMuteLeft_N 	= 8,
	PCM5242_GpioFunction_AnalogMuteRight_N 	= 9,
	PCM5242_GpioFunction_PLLLock 			= 10,
	PCM5242_GpioFunction_ChargePumpClock 	= 11,
	PCM5242_GpioFunction_Reserved1 			= 12,
	PCM5242_GpioFunction_Reserved2 			= 13,
	PCM5242_GpioFunction_UnderVoltage1 		= 14,
	PCM5242_GpioFunction_UnderVoltage2 		= 15,
	PCM5242_GpioFunction_PLLOutputDiv4 		= 16,
	PCM5242_GpioFunction_Count
} PCM5242_GpioFunction_t;

pcm5242_handle_t PCM5242_Init(I2C_HandleTypeDef *hi2c, uint8_t address);

bool PCM5242_Reset(pcm5242_handle_t pcm5242);

bool PCM5242_SetI2SFormat(pcm5242_handle_t pcm5242, uint8_t bits_per_word, uint8_t offset_bck);

bool PCM5242_SetGPIOOutputEnable(pcm5242_handle_t pcm5242, PCM5242_GPIO_t gpio);

bool PCM5242_SetGPIOOutputFunction(pcm5242_handle_t pcm5242, PCM5242_GPIO_t gpio, PCM5242_GpioFunction_t function);

bool PCM5242_SetGPIOOutputValue(pcm5242_handle_t pcm5242, PCM5242_GPIO_t gpio, bool high);

bool PCM5242_SetGPIOOutputInversion(pcm5242_handle_t pcm5242, PCM5242_GPIO_t gpio, bool invert);

#endif /* PCM5242_H_ */
