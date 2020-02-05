/**
 * @file pcm5242.c
 * @author Jonathan Fisher
 * @brief PCM5242 driver
 */
#include "pcm5242.h"

#include <assert.h>
#include <stdlib.h>

typedef struct pcm5242_t
{
    I2C_HandleTypeDef *hi2c;    //! Pointer to the initialized I2C bus on which this device exists
    uint16_t address;           //! Address of the device on the bus
    uint8_t current_page;       //! Track the current page of the device, to avoid extra traffic on the bus
} pcm5242_t;

/**
 * @brief We define a PCM5242 register has being a combination of page and address.
 * @details A register is defined as (page << 8) | address.
 */
typedef uint16_t PCM5242Register;

/**
 * @brief Timeout for when to give up on an I2C transfer. This is somewhat arbitrarily chosen.
 */
#define I2C_OPERATION_TIMEOUT_MS    250

/**
 * @brief Macro for defining a PCM5242 register by combining page and address
 */
#define PCM5242_DEFINE_REGISTER(page, addr) (((page) << 8) | (addr))

/**
 * @brief Macro for retrieving the page of a given register
 */
#define PCM5242_GET_PAGE(reg) (((reg) >> 8) & 0xff)

/**
 * @brief Macro for retrieving the address of a given register
 */
#define PCM5242_GET_ADDR(reg) ((reg) & 0xff)

/*
 * These values are largely copied from the Linux kernel source, found at:
 * https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/codecs/pcm512x.h
 */

/**
 * @defgroup PCM5242 Registers
 * @{
 */
#define PCM5242_PAGE_SELECT             PCM5242_DEFINE_REGISTER(0, 0)
#define PCM5242_RESET                   PCM5242_DEFINE_REGISTER(0, 1)
#define PCM5242_POWER                   PCM5242_DEFINE_REGISTER(0, 2)
#define PCM5242_MUTE                    PCM5242_DEFINE_REGISTER(0, 3)
#define PCM5242_PLL_EN                  PCM5242_DEFINE_REGISTER(0, 4)
#define PCM5242_SPI_MISO_FUNCTION       PCM5242_DEFINE_REGISTER(0, 6)
#define PCM5242_DSP                     PCM5242_DEFINE_REGISTER(0, 7)
#define PCM5242_GPIO_EN                 PCM5242_DEFINE_REGISTER(0, 8)
#define PCM5242_BCLK_LRCLK_CFG          PCM5242_DEFINE_REGISTER(0, 9)
#define PCM5242_DSP_GPIO_INPUT          PCM5242_DEFINE_REGISTER(0, 10)
#define PCM5242_MASTER_MODE             PCM5242_DEFINE_REGISTER(0, 12)
#define PCM5242_PLL_REF                 PCM5242_DEFINE_REGISTER(0, 13)
#define PCM5242_DAC_REF                 PCM5242_DEFINE_REGISTER(0, 14)
#define PCM5242_GPIO_DACIN              PCM5242_DEFINE_REGISTER(0, 16)
#define PCM5242_GPIO_PLLIN              PCM5242_DEFINE_REGISTER(0, 18)
#define PCM5242_SYNCHRONIZE             PCM5242_DEFINE_REGISTER(0, 19)
#define PCM5242_PLL_COEFF_0             PCM5242_DEFINE_REGISTER(0, 20)
#define PCM5242_PLL_COEFF_1             PCM5242_DEFINE_REGISTER(0, 21)
#define PCM5242_PLL_COEFF_2             PCM5242_DEFINE_REGISTER(0, 22)
#define PCM5242_PLL_COEFF_3             PCM5242_DEFINE_REGISTER(0, 23)
#define PCM5242_PLL_COEFF_4             PCM5242_DEFINE_REGISTER(0, 24)
#define PCM5242_DSP_CLKDIV              PCM5242_DEFINE_REGISTER(0, 27)
#define PCM5242_DAC_CLKDIV              PCM5242_DEFINE_REGISTER(0, 28)
#define PCM5242_NCP_CLKDIV              PCM5242_DEFINE_REGISTER(0, 29)
#define PCM5242_OSR_CLKDIV              PCM5242_DEFINE_REGISTER(0, 30)
#define PCM5242_MASTER_CLKDIV_1         PCM5242_DEFINE_REGISTER(0, 32)
#define PCM5242_MASTER_CLKDIV_2         PCM5242_DEFINE_REGISTER(0, 33)
#define PCM5242_FS_SPEED_MODE           PCM5242_DEFINE_REGISTER(0, 34)
#define PCM5242_IDAC_1                  PCM5242_DEFINE_REGISTER(0, 35)
#define PCM5242_IDAC_2                  PCM5242_DEFINE_REGISTER(0, 36)
#define PCM5242_ERROR_DETECT            PCM5242_DEFINE_REGISTER(0, 37)
#define PCM5242_I2S_1                   PCM5242_DEFINE_REGISTER(0, 40)
#define PCM5242_I2S_2                   PCM5242_DEFINE_REGISTER(0, 41)
#define PCM5242_DAC_ROUTING             PCM5242_DEFINE_REGISTER(0, 42)
#define PCM5242_DSP_PROGRAM             PCM5242_DEFINE_REGISTER(0, 43)
#define PCM5242_CLKDET                  PCM5242_DEFINE_REGISTER(0, 44)
#define PCM5242_AUTO_MUTE               PCM5242_DEFINE_REGISTER(0, 59)
#define PCM5242_DIGITAL_VOLUME_1        PCM5242_DEFINE_REGISTER(0, 60)
#define PCM5242_DIGITAL_VOLUME_2        PCM5242_DEFINE_REGISTER(0, 61)
#define PCM5242_DIGITAL_VOLUME_3        PCM5242_DEFINE_REGISTER(0, 62)
#define PCM5242_DIGITAL_MUTE_1          PCM5242_DEFINE_REGISTER(0, 63)
#define PCM5242_DIGITAL_MUTE_2          PCM5242_DEFINE_REGISTER(0, 64)
#define PCM5242_DIGITAL_MUTE_3          PCM5242_DEFINE_REGISTER(0, 65)
#define PCM5242_GPIO_OUTPUT_1           PCM5242_DEFINE_REGISTER(0, 80)
#define PCM5242_GPIO_OUTPUT_2           PCM5242_DEFINE_REGISTER(0, 81)
#define PCM5242_GPIO_OUTPUT_3           PCM5242_DEFINE_REGISTER(0, 82)
#define PCM5242_GPIO_OUTPUT_4           PCM5242_DEFINE_REGISTER(0, 83)
#define PCM5242_GPIO_OUTPUT_5           PCM5242_DEFINE_REGISTER(0, 84)
#define PCM5242_GPIO_OUTPUT_6           PCM5242_DEFINE_REGISTER(0, 85)
#define PCM5242_GPIO_CONTROL_1          PCM5242_DEFINE_REGISTER(0, 86)
#define PCM5242_GPIO_CONTROL_2          PCM5242_DEFINE_REGISTER(0, 87)
#define PCM5242_OVERFLOW                PCM5242_DEFINE_REGISTER(0, 90)
#define PCM5242_RATE_DET_1              PCM5242_DEFINE_REGISTER(0, 91)
#define PCM5242_RATE_DET_2              PCM5242_DEFINE_REGISTER(0, 92)
#define PCM5242_RATE_DET_3              PCM5242_DEFINE_REGISTER(0, 93)
#define PCM5242_RATE_DET_4              PCM5242_DEFINE_REGISTER(0, 94)
#define PCM5242_CLOCK_STATUS            PCM5242_DEFINE_REGISTER(0, 95)
#define PCM5242_ANALOG_MUTE_DET         PCM5242_DEFINE_REGISTER(0, 108)
#define PCM5242_GPIN                    PCM5242_DEFINE_REGISTER(0, 119)
#define PCM5242_DIGITAL_MUTE_DET        PCM5242_DEFINE_REGISTER(0, 120)

#define PCM5242_OUTPUT_AMPLITUDE        PCM5242_DEFINE_REGISTER(1, 1)
#define PCM5242_ANALOG_GAIN_CTRL        PCM5242_DEFINE_REGISTER(1, 2)
#define PCM5242_UNDERVOLTAGE_PROT       PCM5242_DEFINE_REGISTER(1, 5)
#define PCM5242_ANALOG_MUTE_CTRL        PCM5242_DEFINE_REGISTER(1, 6)
#define PCM5242_ANALOG_GAIN_BOOST       PCM5242_DEFINE_REGISTER(1, 7)
#define PCM5242_VCOM_CTRL_1             PCM5242_DEFINE_REGISTER(1, 8)
#define PCM5242_VCOM_CTRL_2             PCM5242_DEFINE_REGISTER(1, 9)

#define PCM5242_CRAM_CTRL               PCM5242_DEFINE_REGISTER(44, 1)

#define PCM5242_FLEX_A                  PCM5242_DEFINE_REGISTER(253, 63)
#define PCM5242_FLEX_B                  PCM5242_DEFINE_REGISTER(253, 64)

/**
 * @}
 */

/**
 * @defgroup PCM5242 Register bit definitions
 * @{
 */

/* Page 0, Register 1: Reset */
#define PCM5242_RSTR (1 << 0)
#define PCM5242_RSTM (1 << 4)

/* Page 0, Register 37: Error detection flags */
#define PCM5242_IPLK                (1 << 0) //! Ignore PLL Lock Detection
#define PCM5242_DCAS                (1 << 1) //! Disable Clock Divider Autoset
#define PCM5242_IDCM                (1 << 2) //! Ignore LRCK/BCK Missing Detection
#define PCM5242_IDCH                (1 << 3) //! Ignore Clock Halt Detection
#define PCM5242_IDSK                (1 << 4) //! Ignore SCK Detection
#define PCM5242_IDBK                (1 << 5) //! Ignore BCK Detection
#define PCM5242_IDFS                (1 << 6) //! Ignore FS Detection

/* Page 0, Register 40: I2S configuration */
#define PCM5242_ALEN                (3 << 0)
#define PCM5242_ALEN_SHIFT          0
#define PCM5242_ALEN_16             (0 << 0)
#define PCM5242_ALEN_20             (1 << 0)
#define PCM5242_ALEN_24             (2 << 0)
#define PCM5242_ALEN_32             (3 << 0)
#define PCM5242_AFMT                (3 << 4)
#define PCM5242_AFMT_SHIFT          4
#define PCM5242_AFMT_I2S            (0 << 4)
#define PCM5242_AFMT_DSP            (1 << 4)
#define PCM5242_AFMT_RTJ            (2 << 4)
#define PCM5242_AFMT_LTJ            (3 << 4)

/**
 * @}
 */
static bool PCM5242_SetPage(pcm5242_handle_t pcm5242, uint8_t page);

/**
 * @brief Write the given value to the given register
 * @param pcm5242 Handle to an initialized PCM5242 device
 * @param reg The register to which to write the given value, where register = (page << 8) | address
 * @param value The value to write to the given register
 * @return True if successful, otherwise false
 */
static bool PCM5242_WriteRegister(pcm5242_handle_t pcm5242, PCM5242Register reg, uint8_t value)
{
    const uint8_t page = PCM5242_GET_PAGE(reg);
    const uint8_t addr = PCM5242_GET_ADDR(reg);

    assert(pcm5242 != NULL);
    if (pcm5242 == NULL)
        return false;

    // Check to see if we need to change the current register page. Note that this must
    // be done carefully, since the PCM5242_SetPage() function can call back into this
    // function. Don't recurse off into infinity!
    if (reg != PCM5242_PAGE_SELECT && pcm5242->current_page != page)
    {
        if (!PCM5242_SetPage(pcm5242, page))
        {
            return false;
        }
    }

    // The chip is on the correct page, so we can now read/write to the address we are after.
    // Note that this is currently being done in blocking mode.
    if (HAL_OK != HAL_I2C_Mem_Write(pcm5242->hi2c, pcm5242->address, addr,
                                    I2C_MEMADD_SIZE_8BIT, &value, 1, I2C_OPERATION_TIMEOUT_MS))
    {
        return false;
    }

    return true;
}

/**
 * @brief Read the value of a given register
 * @param pcm5242 Handle of an initialized PCM5242 device
 * @param reg The register whose value we wish to read, where register = (page << 8) | address
 * @param value Pointer to location to which to write the resultant value
 * @return True if successful, otherwise false
 */
static bool PCM5242_ReadRegister(pcm5242_handle_t pcm5242, PCM5242Register reg, uint8_t *value)
{
    const uint8_t page = PCM5242_GET_PAGE(reg);
    const uint8_t addr = PCM5242_GET_ADDR(reg);

    assert(pcm5242 != NULL);
    assert(value != NULL);

    if (pcm5242 == NULL)
        return false;

    if (value == NULL)
        return false;

    // First check to see whether we need to change the chip's page.
    if (pcm5242->current_page != page)
    {
        if (!PCM5242_SetPage(pcm5242, page))
        {
            return false;
        }
    }

    // The chip is on the correct page, so now we can proceed with asking to read the
    // specific address. Note that we are currently doing this in blocking mode.
    if (HAL_OK != HAL_I2C_Mem_Read(pcm5242->hi2c, pcm5242->address, addr,
                                   I2C_MEMADD_SIZE_8BIT, value, 1, I2C_OPERATION_TIMEOUT_MS))
    {
        return false;
    }

    return true;
}

/**
 * @brief Set the register page on the PCM5242
 * @param pcm5242 Handle to initialized PCM5242 device
 * @param page The page we wish to set
 * @return True if successful, otherwise false
 */
static bool PCM5242_SetPage(pcm5242_handle_t pcm5242, uint8_t page)
{
    assert(pcm5242 != NULL);
    if (pcm5242 == NULL)
        return false;

    if (!PCM5242_WriteRegister(pcm5242, PCM5242_PAGE_SELECT, page))
    {
        return false;
    }

    pcm5242->current_page = page;

    return true;
}

/**
 * @brief Write to the flex registers, unlocking various clock settings for write
 * @param pcm5242 Handle to initialized PCM5242
 * @return True if successful, otherwise false
 */
static bool PCM5242_WriteFlexRegisters(pcm5242_handle_t pcm5242)
{
    return PCM5242_WriteRegister(pcm5242, PCM5242_FLEX_A, 0x11) && PCM5242_WriteRegister(pcm5242, PCM5242_FLEX_B, 0xff);
}

/*****************************************************************************
 * The following are public methods.
 *****************************************************************************/

pcm5242_handle_t PCM5242_Init(I2C_HandleTypeDef *hi2c, uint8_t address)
{
    pcm5242_handle_t pcm5242;

    assert(hi2c != NULL);
    if (hi2c == NULL)
        return NULL;

    pcm5242 = malloc(sizeof(pcm5242_t));
    assert(pcm5242 != NULL);
    if (pcm5242 == NULL)
        return NULL;

    pcm5242->address = address;
    pcm5242->hi2c = hi2c;

    // Set the current page up front. This will initialize the current_page field.
    if (!PCM5242_SetPage(pcm5242, 0))
    {
        free(pcm5242);
        return NULL;
    }

    // Reset the chip putting it into a known state.
    if (!PCM5242_Reset(pcm5242))
    {
        free(pcm5242);
        return NULL;
    }

    return pcm5242;
}

bool PCM5242_Reset(pcm5242_handle_t pcm5242)
{
    assert(pcm5242 != NULL);
    if (pcm5242 == NULL)
        return false;

    if (!PCM5242_WriteRegister(pcm5242, PCM5242_RESET, PCM5242_RSTR | PCM5242_RSTM))
        return false;

    if (!PCM5242_WriteRegister(pcm5242, PCM5242_RESET, 0))
        return false;

    return true;
}

bool PCM5242_SetI2SFormat(pcm5242_handle_t pcm5242, uint8_t bits_per_word, uint8_t offset_bck)
{
    uint8_t reg40 = 0;

    assert(pcm5242 != NULL);
    if (pcm5242 == NULL)
        return false;

    // This function is used to set the I2S format, so we set those bits
    // to start with.
    reg40 = PCM5242_AFMT_I2S;

    switch (bits_per_word)
    {
        case 16:
            reg40 |= PCM5242_ALEN_16;
            break;

        case 20:
            reg40 |= PCM5242_ALEN_20;
            break;

        case 24:
            reg40 |= PCM5242_ALEN_24;
            break;

        case 32:
            reg40 |= PCM5242_ALEN_32;
            break;

        default:
            return false;
    }


    if (!PCM5242_WriteRegister(pcm5242, PCM5242_I2S_1, reg40))
    {
        return false;
    }

    if (!PCM5242_WriteRegister(pcm5242, PCM5242_I2S_2, offset_bck))
    {
        return false;
    }

    return true;
}

bool PCM5242_SetGPIOOutputEnable(pcm5242_handle_t pcm5242, PCM5242_GPIO_t gpio)
{
    uint8_t gpio_mask;

    assert(pcm5242 != NULL);
    if (pcm5242 == NULL)
        return false;

    assert(gpio >= PCM5242_GPIO_1 && gpio < PCM5242_GPIO_Count);
    if (gpio < PCM5242_GPIO_1 || gpio >= PCM5242_GPIO_Count)
        return false;

    // Read the current value of the GPIO output-enable register.
    if (!PCM5242_ReadRegister(pcm5242, PCM5242_GPIO_EN, &gpio_mask))
        return false;

    gpio_mask |= (1 << gpio);

    return PCM5242_WriteRegister(pcm5242, PCM5242_GPIO_EN, gpio_mask);
}

bool PCM5242_SetGPIOOutputFunction(pcm5242_handle_t pcm5242, PCM5242_GPIO_t gpio, PCM5242_GpioFunction_t function)
{
    assert(pcm5242 != NULL);
    if (pcm5242 == NULL)
        return false;

    assert(gpio >= PCM5242_GPIO_1 && gpio < PCM5242_GPIO_Count);
    if (gpio < PCM5242_GPIO_1 || gpio >= PCM5242_GPIO_Count)
        return false;

    assert(function >= PCM5242_GpioFunction_Off && function < PCM5242_GpioFunction_Count);
    if (function < PCM5242_GpioFunction_Off || function >= PCM5242_GpioFunction_Count)
        return false;

    assert(function != PCM5242_GpioFunction_Reserved1 && function != PCM5242_GpioFunction_Reserved2);
    if (function == PCM5242_GpioFunction_Reserved1 || function == PCM5242_GpioFunction_Reserved2)
        return false;

    if (!PCM5242_SetGPIOOutputEnable(pcm5242, gpio))
        return false;

    return PCM5242_WriteRegister(pcm5242, PCM5242_GPIO_OUTPUT_1 + gpio, function);
}

bool PCM5242_SetGPIOOutputValue(pcm5242_handle_t pcm5242, PCM5242_GPIO_t gpio, bool high)
{
    uint8_t mask;

    assert(pcm5242 != NULL);
    if (pcm5242 == NULL)
        return false;

    assert(gpio >= PCM5242_GPIO_1 && gpio < PCM5242_GPIO_Count);
    if (gpio < PCM5242_GPIO_1 || gpio >= PCM5242_GPIO_Count)
        return false;

    if (!PCM5242_ReadRegister(pcm5242, PCM5242_GPIO_CONTROL_1, &mask))
        return false;

    if (high)
        mask |= (1 << gpio);
    else
        mask &= ~(1 << gpio);

    return PCM5242_WriteRegister(pcm5242, PCM5242_GPIO_CONTROL_1, mask);
}

bool PCM5242_SetGPIOOutputInversion(pcm5242_handle_t pcm5242, PCM5242_GPIO_t gpio, bool invert)
{
    uint8_t mask;

    assert(pcm5242 != NULL);
    if (pcm5242 == NULL)
        return false;

    assert(gpio >= PCM5242_GPIO_1 && gpio < PCM5242_GPIO_Count);
    if (gpio < PCM5242_GPIO_1 || gpio >= PCM5242_GPIO_Count)
        return false;

    if (!PCM5242_ReadRegister(pcm5242, PCM5242_GPIO_CONTROL_2, &mask))
        return false;

    if (invert)
        mask |= (1 << gpio);
    else
        mask &= ~(1 << gpio);

    return PCM5242_WriteRegister(pcm5242, PCM5242_GPIO_CONTROL_2, mask);
}
