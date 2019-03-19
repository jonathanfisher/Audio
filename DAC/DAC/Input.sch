EESchema Schematic File Version 4
LIBS:DAC-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_01x06 J?
U 1 1 5C91699E
P 1950 1600
F 0 "J?" H 2030 1592 50  0000 L CNN
F 1 "Conn_01x06" H 2030 1501 50  0000 L CNN
F 2 "" H 1950 1600 50  0001 C CNN
F 3 "~" H 1950 1600 50  0001 C CNN
	1    1950 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 1400 1750 1400
Wire Wire Line
	1650 1500 1750 1500
Wire Wire Line
	1650 1600 1750 1600
Wire Wire Line
	1650 1700 1750 1700
Wire Wire Line
	1650 1800 1750 1800
Wire Wire Line
	1650 1900 1750 1900
Text GLabel 1650 1400 0    39   Input ~ 0
I2S_MCLK
Text GLabel 1650 1500 0    39   Input ~ 0
I2S_LRCK
Text GLabel 1650 1600 0    39   Input ~ 0
I2S_SDOUT
Text GLabel 1650 1700 0    39   Input ~ 0
I2S_SCLK
Text GLabel 1650 1800 0    39   Input ~ 0
GND
Text GLabel 1650 1900 0    39   Input ~ 0
VUSB
$EndSCHEMATC
