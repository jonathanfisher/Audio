#ifndef PCM5242_H_
#define PCM5242_H_

#include <stdint.h>
#include <stdbool.h>

#include "stm32f7xx_hal.h"

/**
 * @brief Handle to a PCM5242 instance. This is only to be used in conjunction w/the public functions.
 */
typedef struct pcm5242_t *pcm5242_handle_t;

/**
 * @brief GPIOs available on the PCM5242. Note that these values correspond to the bit position in the register masks.
 */
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

/**
 * @brief GPIOs can be configured to perform these various functions.
 */
typedef enum
{
    PCM5242_GpioFunction_Off                = 0,
    PCM5242_GpioFunction_DSPOutput          = 1,
    PCM5242_GpioFunction_RegisterOutput     = 2,
    PCM5242_GpioFunction_AutoMuteBoth       = 3,
    PCM5242_GpioFunction_AutoMuteLeft       = 4,
    PCM5242_GpioFunction_AutoMuteRight      = 5,
    PCM5242_GpioFunction_ClockInvalid       = 6,
    PCM5242_GpioFunction_SDOUT              = 7,
    PCM5242_GpioFunction_AnalogMuteLeft_N   = 8,
    PCM5242_GpioFunction_AnalogMuteRight_N  = 9,
    PCM5242_GpioFunction_PLLLock            = 10,
    PCM5242_GpioFunction_ChargePumpClock    = 11,
    PCM5242_GpioFunction_Reserved1          = 12,
    PCM5242_GpioFunction_Reserved2          = 13,
    PCM5242_GpioFunction_UnderVoltage1      = 14,
    PCM5242_GpioFunction_UnderVoltage2      = 15,
    PCM5242_GpioFunction_PLLOutputDiv4      = 16,
    PCM5242_GpioFunction_Count
} PCM5242_GpioFunction_t;

/**
 * @brief Initialize a PCM5242 device at the given I2C address on the given I2C bus
 * @param hi2c Pointer to the I2C descriptor for the bus on which the device is attached
 * @param address I2C address of the device on the bus
 * @return A handle to the PCM5242 device if successful, otherwise NULL.
 */
pcm5242_handle_t PCM5242_Init(I2C_HandleTypeDef *hi2c, uint8_t address);

/**
 * @brief Clean up the PCM5242 chip handle and release memory
 * @param pcm5242 A handle to an initialized PCM5242
 */
void PCM5242_Free(pcm5242_handle_t pcm5242);

/**
 * @brief Reset the PCM5242 device
 * @param pcm5242 Handle to the initialized PCM5242 device
 * @return True if successful, otherwise false
 */
bool PCM5242_Reset(pcm5242_handle_t pcm5242);

/**
 * @brief Tell the chip to enter standby mode
 * @param pcm5242 Handle to an initialized PCM5242
 * @return true if successful, otherwise false
 */
bool PCM5242_Standby(pcm5242_handle_t pcm5242);

/**
 * @brief Request the PCM5242 to power down everything.
 * @param pcm5242 Handle to an initialized PCM5242
 * @return True if successful, otherwise false
 */
bool PCM5242_PowerOff(pcm5242_handle_t pcm5242);

/**
 * @brief Set the PCM5242 power state to "on"
 * @param pcm5242 Handle of an initialized PCM5242
 * @return true if successful, otherwise false
 */
bool PCM5242_Activate(pcm5242_handle_t pcm5242);

/**
 * @brief Set the I2S format for the Audio subsystem of the DAC
 * @param pcm5242 Handle of the initialized PCM5242 device
 * @param bits_per_word Number of bits per word transferred on the I2S bus
 * @param offset_bck # of BCK cycles after audio frame to find the desired audio sample
 * @return True if successful, otherwise false
 */
bool PCM5242_SetI2SFormat(pcm5242_handle_t pcm5242, uint8_t bits_per_word, uint8_t offset_bck);

/**
 * @brief Set the given GPIO to an output
 * @param pcm5242 Handle of the initialized PCM5242 device
 * @param gpio The GPIO we wish to select as an output (note: just one GPIO, not a mask)
 * @return True if successful, otherwise false
 */
bool PCM5242_SetGPIOOutputEnable(pcm5242_handle_t pcm5242, PCM5242_GPIO_t gpio);

/**
 * @brief Set the output function of the given GPIO
 * @param pcm5242 Handle of initialized PCM5242
 * @param gpio The GPIO whose function we wish to set
 * @param function The function to associate with this GPIO
 * @return True if successful, otherwise false
 */
bool PCM5242_SetGPIOOutputFunction(pcm5242_handle_t pcm5242, PCM5242_GPIO_t gpio, PCM5242_GpioFunction_t function);

/**
 * @brief Set the output value of the given GPIO (assumes it has been set as output w/function \ref PCM5242_GpioFunction_RegisterOutput
 * @param pcm5242 Handle of an initialized PCM5242 device
 * @param gpio GPIO whose value we wish to set
 * @param high Value to set the GPIO to (true = high, false = low)
 * @return True if successful, otherwise false
 */
bool PCM5242_SetGPIOOutputValue(pcm5242_handle_t pcm5242, PCM5242_GPIO_t gpio, bool high);

/**
 * @brief Select whether or not to invert the given GPIO's output value
 * @param pcm5242 Handle to initialized PCM5242
 * @param gpio GPIO for which to set the inversion setting
 * @param invert Selects whether or not to invert the pin (true = invert, false = do not invert)
 * @return True if successful, otherwise false
 */
bool PCM5242_SetGPIOOutputInversion(pcm5242_handle_t pcm5242, PCM5242_GPIO_t gpio, bool invert);

#endif /* PCM5242_H_ */
