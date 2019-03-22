EESchema Schematic File Version 4
LIBS:DAC-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 4
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
L Connector_Generic:Conn_01x06 J1
U 1 1 5C91699E
P 2850 2850
F 0 "J1" H 2930 2842 50  0000 L CNN
F 1 "Conn_01x06" H 2930 2751 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x06_P2.54mm_Horizontal" H 2850 2850 50  0001 C CNN
F 3 "~" H 2850 2850 50  0001 C CNN
	1    2850 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 2650 2650 2650
Wire Wire Line
	2550 2750 2650 2750
Wire Wire Line
	2550 2850 2650 2850
Wire Wire Line
	2550 2950 2650 2950
Wire Wire Line
	2150 3050 2250 3050
Wire Wire Line
	2550 3150 2650 3150
Text GLabel 2550 2650 0    39   Input ~ 0
I2S_MCLK
Text GLabel 2550 2750 0    39   Input ~ 0
I2S_LRCK
Text GLabel 2550 2850 0    39   Input ~ 0
I2S_DIN
Text GLabel 2550 2950 0    39   Input ~ 0
I2S_SCLK
Text GLabel 2150 3050 0    39   Input ~ 0
GND
Text GLabel 2550 3150 0    39   Input ~ 0
VUSB
Text Notes 3150 1850 2    197  ~ 0
INPUT
Wire Notes Line
	1450 1600 1450 3850
Wire Notes Line
	1450 3850 3900 3850
Wire Notes Line
	3900 3850 3900 1600
Wire Notes Line
	3900 1600 1450 1600
$Comp
L Connector_Generic:Conn_01x06 J2
U 1 1 5CA0A347
P 7950 2850
F 0 "J2" H 8030 2842 50  0000 L CNN
F 1 "Conn_01x06" H 8030 2751 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Horizontal" H 7950 2850 50  0001 C CNN
F 3 "~" H 7950 2850 50  0001 C CNN
	1    7950 2850
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8250 2650 8150 2650
Wire Wire Line
	8250 2750 8150 2750
Wire Wire Line
	8250 2850 8150 2850
Wire Wire Line
	8250 2950 8150 2950
Wire Wire Line
	8250 3050 8150 3050
Wire Wire Line
	8250 3150 8150 3150
Text Notes 8900 1850 2    197  ~ 0
OUTPUT
Wire Notes Line
	7050 1600 7050 3850
Wire Notes Line
	7050 3850 9500 3850
Wire Notes Line
	9500 3850 9500 1600
Wire Notes Line
	9500 1600 7050 1600
Text GLabel 8250 2650 2    50   Input ~ 0
DACR+
Text GLabel 8250 2750 2    50   Input ~ 0
DACR-
Text GLabel 8250 2850 2    50   Input ~ 0
DACL-
Text GLabel 8250 2950 2    50   Input ~ 0
DACL+
Text GLabel 8250 3050 2    50   Input ~ 0
GND
Text GLabel 8250 3150 2    50   Input ~ 0
VUSB
$Comp
L power:VBUS #PWR0127
U 1 1 5CA8E992
P 2850 3450
F 0 "#PWR0127" H 2850 3300 50  0001 C CNN
F 1 "VBUS" H 2865 3623 50  0000 C CNN
F 2 "" H 2850 3450 50  0001 C CNN
F 3 "" H 2850 3450 50  0001 C CNN
	1    2850 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 3150 2650 3500
Wire Wire Line
	2650 3500 2700 3500
Wire Wire Line
	2850 3500 2850 3450
Connection ~ 2650 3150
$Comp
L power:GND #PWR0128
U 1 1 5CA8EF45
P 2250 3200
F 0 "#PWR0128" H 2250 2950 50  0001 C CNN
F 1 "GND" H 2255 3027 50  0000 C CNN
F 2 "" H 2250 3200 50  0001 C CNN
F 3 "" H 2250 3200 50  0001 C CNN
	1    2250 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 3200 2250 3050
Connection ~ 2250 3050
Wire Wire Line
	2250 3050 2650 3050
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5CA90188
P 2700 3500
F 0 "#FLG0101" H 2700 3575 50  0001 C CNN
F 1 "PWR_FLAG" H 2700 3673 50  0000 C CNN
F 2 "" H 2700 3500 50  0001 C CNN
F 3 "~" H 2700 3500 50  0001 C CNN
	1    2700 3500
	-1   0    0    1   
$EndComp
Connection ~ 2700 3500
Wire Wire Line
	2700 3500 2850 3500
$EndSCHEMATC
