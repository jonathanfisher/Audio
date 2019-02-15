EESchema Schematic File Version 4
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 "USB --> I2S"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CP2615-A01-GM:CP2615-A01-GM U?
U 1 1 5C64AD2A
P 6300 4100
F 0 "U?" H 6300 5467 50  0000 C CNN
F 1 "CP2615-A01-GM" H 6300 5376 50  0000 C CNN
F 2 "QFN50P500X500X90-33N" H 6300 4100 50  0001 L BNN
F 3 "Unavailable" H 6300 4100 50  0001 L BNN
F 4 "None" H 6300 4100 50  0001 L BNN "Field4"
F 5 "QFN-32 Silicon Labs" H 6300 4100 50  0001 L BNN "Field5"
F 6 "CP2615-A01-GM" H 6300 4100 50  0001 L BNN "Field6"
F 7 "Usb To I2s Digital Audio Bridge Controller" H 6300 4100 50  0001 L BNN "Field7"
F 8 "Silicon Labs" H 6300 4100 50  0001 L BNN "Field8"
	1    6300 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 3000 7400 3000
Wire Wire Line
	7400 3000 7400 2800
$Comp
L power:+3V3 #PWR?
U 1 1 5C64AE3B
P 7400 2650
F 0 "#PWR?" H 7400 2500 50  0001 C CNN
F 1 "+3V3" H 7415 2823 50  0000 C CNN
F 2 "" H 7400 2650 50  0001 C CNN
F 3 "" H 7400 2650 50  0001 C CNN
	1    7400 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 5200 7400 5200
Wire Wire Line
	7400 5200 7400 5300
$Comp
L power:GND #PWR?
U 1 1 5C64AE77
P 7400 5300
F 0 "#PWR?" H 7400 5050 50  0001 C CNN
F 1 "GND" H 7405 5127 50  0000 C CNN
F 2 "" H 7400 5300 50  0001 C CNN
F 3 "" H 7400 5300 50  0001 C CNN
	1    7400 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 3600 7300 3600
Wire Wire Line
	7500 3700 7300 3700
Wire Wire Line
	7500 3800 7300 3800
Wire Wire Line
	7500 3900 7300 3900
Wire Wire Line
	5200 3300 5300 3300
Wire Wire Line
	5200 3400 5300 3400
Wire Wire Line
	5200 3600 5300 3600
Wire Wire Line
	5200 3900 5300 3900
Wire Wire Line
	5200 4000 5300 4000
Wire Wire Line
	7300 3100 7400 3100
Wire Wire Line
	7400 3100 7400 3000
Connection ~ 7400 3000
$Comp
L power:GND #PWR?
U 1 1 5C650FD4
P 7950 3150
F 0 "#PWR?" H 7950 2900 50  0001 C CNN
F 1 "GND" H 7955 2977 50  0000 C CNN
F 2 "" H 7950 3150 50  0001 C CNN
F 3 "" H 7950 3150 50  0001 C CNN
	1    7950 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5C65100D
P 7750 2950
F 0 "C?" H 7842 2996 50  0000 L CNN
F 1 "1uF" H 7842 2905 50  0000 L CNN
F 2 "" H 7750 2950 50  0001 C CNN
F 3 "~" H 7750 2950 50  0001 C CNN
	1    7750 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5C651053
P 8100 2950
F 0 "C?" H 8192 2996 50  0000 L CNN
F 1 "0.1uF" H 8192 2905 50  0000 L CNN
F 2 "" H 8100 2950 50  0001 C CNN
F 3 "~" H 8100 2950 50  0001 C CNN
	1    8100 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 3100 7750 3050
Wire Wire Line
	7750 3100 7950 3100
Wire Wire Line
	8100 3100 8100 3050
Wire Wire Line
	7950 3100 7950 3150
Connection ~ 7950 3100
Wire Wire Line
	7950 3100 8100 3100
Wire Wire Line
	8100 2800 8100 2850
Wire Wire Line
	7750 2850 7750 2800
Wire Wire Line
	7750 2800 8100 2800
$Comp
L Device:R_US R?
U 1 1 5C653F04
P 5100 2800
F 0 "R?" H 5168 2846 50  0000 L CNN
F 1 "4.7K" H 5168 2755 50  0000 L CNN
F 2 "" V 5140 2790 50  0001 C CNN
F 3 "~" H 5100 2800 50  0001 C CNN
	1    5100 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 5C653F36
P 4650 2800
F 0 "R?" H 4718 2846 50  0000 L CNN
F 1 "4.7K" H 4718 2755 50  0000 L CNN
F 2 "" V 4690 2790 50  0001 C CNN
F 3 "~" H 4650 2800 50  0001 C CNN
	1    4650 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 2950 5100 3000
Wire Wire Line
	5100 3000 5300 3000
Wire Wire Line
	5100 2600 5100 2650
Wire Wire Line
	4650 2600 4650 2650
Wire Wire Line
	4650 2950 4650 3100
Wire Wire Line
	4650 3100 5300 3100
$Comp
L power:+3V3 #PWR?
U 1 1 5C656788
P 5100 2600
F 0 "#PWR?" H 5100 2450 50  0001 C CNN
F 1 "+3V3" H 5115 2773 50  0000 C CNN
F 2 "" H 5100 2600 50  0001 C CNN
F 3 "" H 5100 2600 50  0001 C CNN
	1    5100 2600
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5C65679D
P 4650 2600
F 0 "#PWR?" H 4650 2450 50  0001 C CNN
F 1 "+3V3" H 4665 2773 50  0000 C CNN
F 2 "" H 4650 2600 50  0001 C CNN
F 3 "" H 4650 2600 50  0001 C CNN
	1    4650 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 5C656870
P 4250 3600
F 0 "R?" H 4318 3646 50  0000 L CNN
F 1 "24K" H 4318 3555 50  0000 L CNN
F 2 "" V 4290 3590 50  0001 C CNN
F 3 "~" H 4250 3600 50  0001 C CNN
	1    4250 3600
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 5C6568B4
P 4250 4000
F 0 "R?" H 4318 4046 50  0000 L CNN
F 1 "47K" H 4318 3955 50  0000 L CNN
F 2 "" V 4290 3990 50  0001 C CNN
F 3 "~" H 4250 4000 50  0001 C CNN
	1    4250 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 3750 4250 3800
Wire Wire Line
	4250 3450 4250 3350
Wire Wire Line
	4250 3350 4150 3350
Wire Wire Line
	4250 4200 4250 4150
$Comp
L power:GND #PWR?
U 1 1 5C65A0EC
P 4250 4200
F 0 "#PWR?" H 4250 3950 50  0001 C CNN
F 1 "GND" H 4255 4027 50  0000 C CNN
F 2 "" H 4250 4200 50  0001 C CNN
F 3 "" H 4250 4200 50  0001 C CNN
	1    4250 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 3800 5300 3800
Connection ~ 4250 3800
Wire Wire Line
	4250 3800 4250 3850
Text GLabel 5200 3900 0    39   BiDi ~ 0
VBUS_DP
Text GLabel 5200 4000 0    39   BiDi ~ 0
VBUS_DN
Text GLabel 4150 3350 0    39   BiDi ~ 0
VBUS_IN
Wire Notes Line
	3800 3250 4700 3250
Wire Notes Line
	4700 3250 4700 4500
Wire Notes Line
	4700 4500 3800 4500
Wire Notes Line
	3800 4500 3800 3250
Text Notes 3800 4750 0    20   ~ 0
Note from CP2615 datasheet figure 3.7.2:\nFor self-powered systems where VDD may\nbe unpowered when VBUS is connected to\n5 V, a resistor divider (or functionally-equivalent\ncircuit) on VBUS is required to meet the\nabsolute maximum voltage on VBUS specification\nin the Electrical Characteristics section.
$Comp
L Power_Protection:SP0503BAHT D?
U 1 1 5C65DB12
P 2150 2000
F 0 "D?" H 2355 2046 50  0000 L CNN
F 1 "SP0503BAHT" H 2355 1955 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-143" H 2375 1950 50  0001 L CNN
F 3 "http://www.littelfuse.com/~/media/files/littelfuse/technical%20resources/documents/data%20sheets/sp05xxba.pdf" H 2275 2125 50  0001 C CNN
	1    2150 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C65DBF0
P 2150 2300
F 0 "#PWR?" H 2150 2050 50  0001 C CNN
F 1 "GND" H 2155 2127 50  0000 C CNN
F 2 "" H 2150 2300 50  0001 C CNN
F 3 "" H 2150 2300 50  0001 C CNN
	1    2150 2300
	1    0    0    -1  
$EndComp
Text GLabel 2250 1150 1    39   BiDi ~ 0
VBUS_IN
Text GLabel 2150 1150 1    39   BiDi ~ 0
VBUS_DP
Text GLabel 2050 1150 1    39   BiDi ~ 0
VBUS_DN
Connection ~ 7400 2800
Wire Wire Line
	7400 2800 7400 2650
Connection ~ 7750 2800
Text GLabel 7500 3600 2    39   Output ~ 0
I2S_SDOUT
Text GLabel 7500 3700 2    39   Output ~ 0
I2S_MCLK
Text GLabel 7500 3800 2    39   Output ~ 0
I2S_LRCLK
Text GLabel 7500 3900 2    39   Output ~ 0
I2S_SCLK
Text GLabel 5200 3300 0    39   BiDi ~ 0
I2C_SCL
Text GLabel 5200 3400 0    39   BiDi ~ 0
I2C_SDA
Text GLabel 5200 3600 0    39   Input ~ 0
I2S_SDIN
Connection ~ 4650 3100
Wire Wire Line
	4550 3100 4650 3100
Wire Wire Line
	5000 3000 5100 3000
Connection ~ 5100 3000
Text GLabel 4550 3100 0    39   Input ~ 0
CFGMODEB
Text GLabel 5000 3000 0    39   Input ~ 0
RSTB
Wire Wire Line
	7400 2800 7750 2800
$Comp
L Connector:Conn_01x06_Male J?
U 1 1 5C685CE0
P 9650 3750
F 0 "J?" H 9623 3773 50  0000 R CNN
F 1 "Conn_01x06_Male" H 9623 3682 50  0000 R CNN
F 2 "" H 9650 3750 50  0001 C CNN
F 3 "~" H 9650 3750 50  0001 C CNN
	1    9650 3750
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9400 3550 9450 3550
Wire Wire Line
	9400 3650 9450 3650
Wire Wire Line
	9400 3750 9450 3750
Wire Wire Line
	9400 3850 9450 3850
Text GLabel 9400 3550 0    39   Output ~ 0
I2S_SDOUT
Text GLabel 9400 3650 0    39   Output ~ 0
I2S_MCLK
Text GLabel 9400 3750 0    39   Output ~ 0
I2S_LRCLK
Text GLabel 9400 3850 0    39   Output ~ 0
I2S_SCLK
$Comp
L Connector:USB_B_Micro J?
U 1 1 5C6A9B8D
P 1150 1600
F 0 "J?" H 1205 2067 50  0000 C CNN
F 1 "USB_B_Micro" H 1205 1976 50  0000 C CNN
F 2 "" H 1300 1550 50  0001 C CNN
F 3 "~" H 1300 1550 50  0001 C CNN
	1    1150 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 2200 2150 2250
Wire Wire Line
	1050 2000 1050 2250
Wire Wire Line
	1050 2250 1150 2250
Connection ~ 2150 2250
Wire Wire Line
	2150 2250 2150 2300
Wire Wire Line
	1150 2000 1150 2250
Connection ~ 1150 2250
Wire Wire Line
	1150 2250 2150 2250
Wire Wire Line
	2250 1150 2250 1400
Wire Wire Line
	2150 1150 2150 1600
Wire Wire Line
	2050 1150 2050 1700
Wire Wire Line
	1450 1700 2050 1700
Connection ~ 2050 1700
Wire Wire Line
	2050 1700 2050 1800
Wire Wire Line
	1450 1600 2150 1600
Connection ~ 2150 1600
Wire Wire Line
	2150 1600 2150 1800
Wire Wire Line
	1450 1400 2250 1400
Connection ~ 2250 1400
Wire Wire Line
	2250 1400 2250 1800
$Comp
L Regulator_Linear:LP5907MFX-1.8 U?
U 1 1 5C6C6DD1
P 4250 1500
F 0 "U?" H 4250 1867 50  0000 C CNN
F 1 "LP5907MFX-1.8" H 4250 1776 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 4250 1850 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lp5907.pdf" H 4250 2000 50  0001 C CNN
	1    4250 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 1500 3950 1500
Wire Wire Line
	4250 1850 4250 1800
$Comp
L power:GND #PWR?
U 1 1 5C6CCD08
P 4250 1850
F 0 "#PWR?" H 4250 1600 50  0001 C CNN
F 1 "GND" H 4255 1677 50  0000 C CNN
F 2 "" H 4250 1850 50  0001 C CNN
F 3 "" H 4250 1850 50  0001 C CNN
	1    4250 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5C6CCD56
P 3550 1600
F 0 "C?" H 3642 1646 50  0000 L CNN
F 1 "10uF" H 3642 1555 50  0000 L CNN
F 2 "" H 3550 1600 50  0001 C CNN
F 3 "~" H 3550 1600 50  0001 C CNN
	1    3550 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5C6CCDB0
P 4700 1550
F 0 "C?" H 4792 1596 50  0000 L CNN
F 1 "10uF" H 4792 1505 50  0000 L CNN
F 2 "" H 4700 1550 50  0001 C CNN
F 3 "~" H 4700 1550 50  0001 C CNN
	1    4700 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 1450 4700 1400
Wire Wire Line
	4550 1400 4700 1400
Wire Wire Line
	4250 1800 4700 1800
Wire Wire Line
	4700 1800 4700 1650
Connection ~ 4250 1800
Wire Wire Line
	4250 1800 3550 1800
Wire Wire Line
	3550 1800 3550 1700
Wire Wire Line
	3550 1400 3550 1500
Wire Wire Line
	3550 1400 3900 1400
Wire Wire Line
	3900 1500 3900 1400
Connection ~ 3900 1400
Wire Wire Line
	3900 1400 3950 1400
Wire Wire Line
	4750 1400 4700 1400
Connection ~ 4700 1400
Text GLabel 4750 1400 2    39   Output ~ 0
+3V3
Wire Notes Line
	5250 2150 5250 900 
Wire Notes Line
	3100 900  3100 2150
Text Notes 3100 850  0    39   ~ 0
While the CP2615 can create its own 3v3 from the 5V input, I am\nchoosing to create it myself, to try to control noise.
Wire Wire Line
	3500 1400 3550 1400
Connection ~ 3550 1400
Text GLabel 3500 1400 0    39   Input ~ 0
VBUS_IN
Wire Notes Line
	3100 2150 5250 2150
Wire Notes Line
	3100 900  5250 900 
Wire Wire Line
	9400 3950 9450 3950
Text GLabel 9400 3950 0    39   Output ~ 0
GND
$Comp
L Device:Jumper JP?
U 1 1 5C673436
P 9050 4300
F 0 "JP?" H 9050 4564 50  0000 C CNN
F 1 "Jumper" H 9050 4473 50  0000 C CNN
F 2 "" H 9050 4300 50  0001 C CNN
F 3 "~" H 9050 4300 50  0001 C CNN
	1    9050 4300
	1    0    0    -1  
$EndComp
Text GLabel 8650 4300 0    39   Output ~ 0
VUSB_IN
Wire Wire Line
	8650 4300 8750 4300
Wire Wire Line
	9350 4050 9350 4300
Wire Wire Line
	9350 4050 9450 4050
Text GLabel 9350 4200 2    39   Output ~ 0
VUSB_OUT
Text Notes 8900 4700 0    39   ~ 0
NOTE:\nThe I2S signals are at logic level +3V3. The 5V\noutput is simply a way to pass through USB power\nfor later stages.
$EndSCHEMATC
