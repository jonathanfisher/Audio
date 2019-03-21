EESchema Schematic File Version 4
LIBS:DAC-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 7 7
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
L JFisher:TPA6120A2RGY U?
U 1 1 5C93C445
P 5850 3650
F 0 "U?" H 5850 3078 50  0000 C CNN
F 1 "TPA6120A2RGY" H 5850 2987 50  0000 C CNN
F 2 "" H 5900 3550 50  0001 C CNN
F 3 "" H 5900 3550 50  0001 C CNN
	1    5850 3650
	1    0    0    -1  
$EndComp
$Comp
L Connector:AudioJack3 J?
U 1 1 5C93C868
P 7800 4000
F 0 "J?" H 7520 4025 50  0000 R CNN
F 1 "AudioJack3" H 7520 3934 50  0000 R CNN
F 2 "" H 7800 4000 50  0001 C CNN
F 3 "~" H 7800 4000 50  0001 C CNN
	1    7800 4000
	-1   0    0    -1  
$EndComp
Text Notes 7900 4650 0    50   ~ 0
TRS Plug\nT = Tip = Left\nR = Ring = Right\nS = Sleeve = GND
$Comp
L power:GND #PWR?
U 1 1 5C93C8D9
P 7800 3600
F 0 "#PWR?" H 7800 3350 50  0001 C CNN
F 1 "GND" H 7805 3427 50  0000 C CNN
F 2 "" H 7800 3600 50  0001 C CNN
F 3 "" H 7800 3600 50  0001 C CNN
	1    7800 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 3900 7500 3900
Wire Wire Line
	7500 3900 7500 3450
Wire Wire Line
	7500 3450 7800 3450
Wire Wire Line
	7800 3450 7800 3600
$Comp
L Device:R_Small_US R?
U 1 1 5C93CA15
P 7100 3800
F 0 "R?" V 6895 3800 50  0000 C CNN
F 1 "39.2" V 6986 3800 50  0000 C CNN
F 2 "" H 7100 3800 50  0001 C CNN
F 3 "~" H 7100 3800 50  0001 C CNN
	1    7100 3800
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 5C93CA55
P 7100 4150
F 0 "R?" V 6895 4150 50  0000 C CNN
F 1 "39.2" V 6986 4150 50  0000 C CNN
F 2 "" H 7100 4150 50  0001 C CNN
F 3 "~" H 7100 4150 50  0001 C CNN
	1    7100 4150
	0    1    1    0   
$EndComp
Wire Wire Line
	6550 3850 6750 3850
Wire Wire Line
	6750 3850 6750 3800
Wire Wire Line
	6750 3800 6850 3800
Wire Wire Line
	6550 4000 6750 4000
Wire Wire Line
	6750 4000 6750 4150
Wire Wire Line
	6750 4150 6800 4150
Wire Wire Line
	7200 3800 7350 3800
Wire Wire Line
	7350 3800 7350 4100
Wire Wire Line
	7350 4100 7600 4100
Wire Wire Line
	7200 4150 7250 4150
Wire Wire Line
	7250 4150 7250 4000
Wire Wire Line
	7250 4000 7600 4000
$Comp
L Device:R_Small_US R?
U 1 1 5C93CD26
P 5800 4700
F 0 "R?" V 5595 4700 50  0000 C CNN
F 1 "806" V 5686 4700 50  0000 C CNN
F 2 "" H 5800 4700 50  0001 C CNN
F 3 "~" H 5800 4700 50  0001 C CNN
	1    5800 4700
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 5C93CD4A
P 5800 5100
F 0 "R?" V 5595 5100 50  0000 C CNN
F 1 "806" V 5686 5100 50  0000 C CNN
F 2 "" H 5800 5100 50  0001 C CNN
F 3 "~" H 5800 5100 50  0001 C CNN
	1    5800 5100
	0    1    1    0   
$EndComp
Wire Wire Line
	5900 5100 6800 5100
Wire Wire Line
	6800 5100 6800 4150
Connection ~ 6800 4150
Wire Wire Line
	6800 4150 7000 4150
Wire Wire Line
	5700 5100 4900 5100
Wire Wire Line
	5150 3850 4900 3850
Wire Wire Line
	4900 3850 4900 5100
Wire Wire Line
	5150 3650 4950 3650
Wire Wire Line
	4950 3650 4950 4700
Wire Wire Line
	4950 4700 5700 4700
Wire Wire Line
	5900 4700 6850 4700
Wire Wire Line
	6850 4700 6850 3800
Connection ~ 6850 3800
Wire Wire Line
	6850 3800 7000 3800
Connection ~ 4950 3650
Connection ~ 4900 3850
$Comp
L Device:R_Small_US R?
U 1 1 5C93E94F
P 4050 4250
F 0 "R?" H 3982 4204 50  0000 R CNN
F 1 "806" H 3982 4295 50  0000 R CNN
F 2 "" H 4050 4250 50  0001 C CNN
F 3 "~" H 4050 4250 50  0001 C CNN
	1    4050 4250
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 5C93E991
P 3750 4250
F 0 "R?" H 3682 4204 50  0000 R CNN
F 1 "806" H 3682 4295 50  0000 R CNN
F 2 "" H 3750 4250 50  0001 C CNN
F 3 "~" H 3750 4250 50  0001 C CNN
	1    3750 4250
	-1   0    0    1   
$EndComp
Wire Wire Line
	3750 4400 3750 4350
Wire Wire Line
	4050 4400 4050 4350
$Comp
L power:GND #PWR?
U 1 1 5C9401C0
P 3750 4400
F 0 "#PWR?" H 3750 4150 50  0001 C CNN
F 1 "GND" H 3755 4227 50  0000 C CNN
F 2 "" H 3750 4400 50  0001 C CNN
F 3 "" H 3750 4400 50  0001 C CNN
	1    3750 4400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C9401F2
P 4050 4400
F 0 "#PWR?" H 4050 4150 50  0001 C CNN
F 1 "GND" H 4055 4227 50  0000 C CNN
F 2 "" H 4050 4400 50  0001 C CNN
F 3 "" H 4050 4400 50  0001 C CNN
	1    4050 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 4000 4050 4150
Connection ~ 4050 4000
Wire Wire Line
	4050 4000 5150 4000
Wire Wire Line
	3750 3500 3750 4150
Connection ~ 3750 3500
Wire Wire Line
	3750 3500 5150 3500
$Comp
L Device:R_Small_US R?
U 1 1 5C9422C7
P 2700 3300
F 0 "R?" V 2905 3300 50  0000 C CNN
F 1 "402" V 2814 3300 50  0000 C CNN
F 2 "" H 2700 3300 50  0001 C CNN
F 3 "~" H 2700 3300 50  0001 C CNN
	1    2700 3300
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 5C942300
P 2700 3650
F 0 "R?" V 2905 3650 50  0000 C CNN
F 1 "402" V 2814 3650 50  0000 C CNN
F 2 "" H 2700 3650 50  0001 C CNN
F 3 "~" H 2700 3650 50  0001 C CNN
	1    2700 3650
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 5C94232A
P 2700 4000
F 0 "R?" V 2905 4000 50  0000 C CNN
F 1 "402" V 2814 4000 50  0000 C CNN
F 2 "" H 2700 4000 50  0001 C CNN
F 3 "~" H 2700 4000 50  0001 C CNN
	1    2700 4000
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 5C94235A
P 2700 4350
F 0 "R?" V 2905 4350 50  0000 C CNN
F 1 "402" V 2814 4350 50  0000 C CNN
F 2 "" H 2700 4350 50  0001 C CNN
F 3 "~" H 2700 4350 50  0001 C CNN
	1    2700 4350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2800 4000 3050 4000
Wire Wire Line
	3050 4000 3050 3850
Wire Wire Line
	3050 3850 4900 3850
Wire Wire Line
	2800 4350 3150 4350
Wire Wire Line
	3150 4350 3150 4000
Wire Wire Line
	3150 4000 4050 4000
Wire Wire Line
	2800 3650 4950 3650
Wire Wire Line
	3150 3500 3150 3300
Wire Wire Line
	3150 3300 2800 3300
Wire Wire Line
	3150 3500 3750 3500
$Comp
L Device:C_Small C?
U 1 1 5C951AA6
P 5200 2750
F 0 "C?" H 5292 2796 50  0000 L CNN
F 1 "0.1uF" H 5292 2705 50  0000 L CNN
F 2 "" H 5200 2750 50  0001 C CNN
F 3 "~" H 5200 2750 50  0001 C CNN
	1    5200 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5C951AEA
P 4800 2750
F 0 "C?" H 4892 2796 50  0000 L CNN
F 1 "0.1uF" H 4892 2705 50  0000 L CNN
F 2 "" H 4800 2750 50  0001 C CNN
F 3 "~" H 4800 2750 50  0001 C CNN
	1    4800 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5C952D94
P 4450 2250
F 0 "C?" H 4542 2296 50  0000 L CNN
F 1 "10uF" H 4542 2205 50  0000 L CNN
F 2 "" H 4450 2250 50  0001 C CNN
F 3 "~" H 4450 2250 50  0001 C CNN
	1    4450 2250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C952E18
P 4450 2400
F 0 "#PWR?" H 4450 2150 50  0001 C CNN
F 1 "GND" H 4455 2227 50  0000 C CNN
F 2 "" H 4450 2400 50  0001 C CNN
F 3 "" H 4450 2400 50  0001 C CNN
	1    4450 2400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C952E4D
P 4800 2900
F 0 "#PWR?" H 4800 2650 50  0001 C CNN
F 1 "GND" H 4805 2727 50  0000 C CNN
F 2 "" H 4800 2900 50  0001 C CNN
F 3 "" H 4800 2900 50  0001 C CNN
	1    4800 2900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C952E82
P 5200 2900
F 0 "#PWR?" H 5200 2650 50  0001 C CNN
F 1 "GND" H 5205 2727 50  0000 C CNN
F 2 "" H 5200 2900 50  0001 C CNN
F 3 "" H 5200 2900 50  0001 C CNN
	1    5200 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 2850 5200 2900
Wire Wire Line
	4800 2850 4800 2900
Wire Wire Line
	4450 2350 4450 2400
Wire Wire Line
	4450 2150 4450 2100
Wire Wire Line
	5200 2600 5200 2650
Wire Wire Line
	4800 2650 4800 2600
Wire Wire Line
	4800 2600 5200 2600
Wire Wire Line
	4450 2100 4800 2100
Wire Wire Line
	4800 2100 4800 2400
Connection ~ 4800 2600
Wire Wire Line
	4800 2400 5700 2400
Wire Wire Line
	5700 2400 5700 3050
Connection ~ 4800 2400
Wire Wire Line
	4800 2400 4800 2600
Wire Wire Line
	5200 2600 5550 2600
Wire Wire Line
	5550 2600 5550 3050
Connection ~ 5200 2600
Wire Wire Line
	4800 2100 4800 1700
Connection ~ 4800 2100
$Comp
L Device:C_Small C?
U 1 1 5C961E25
P 6500 2750
F 0 "C?" H 6592 2796 50  0000 L CNN
F 1 "0.1uF" H 6592 2705 50  0000 L CNN
F 2 "" H 6500 2750 50  0001 C CNN
F 3 "~" H 6500 2750 50  0001 C CNN
	1    6500 2750
	-1   0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5C961E2C
P 6900 2750
F 0 "C?" H 6992 2796 50  0000 L CNN
F 1 "0.1uF" H 6992 2705 50  0000 L CNN
F 2 "" H 6900 2750 50  0001 C CNN
F 3 "~" H 6900 2750 50  0001 C CNN
	1    6900 2750
	-1   0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5C961E33
P 7250 2250
F 0 "C?" H 7342 2296 50  0000 L CNN
F 1 "10uF" H 7342 2205 50  0000 L CNN
F 2 "" H 7250 2250 50  0001 C CNN
F 3 "~" H 7250 2250 50  0001 C CNN
	1    7250 2250
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C961E3A
P 7250 2400
F 0 "#PWR?" H 7250 2150 50  0001 C CNN
F 1 "GND" H 7255 2227 50  0000 C CNN
F 2 "" H 7250 2400 50  0001 C CNN
F 3 "" H 7250 2400 50  0001 C CNN
	1    7250 2400
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C961E40
P 6900 2900
F 0 "#PWR?" H 6900 2650 50  0001 C CNN
F 1 "GND" H 6905 2727 50  0000 C CNN
F 2 "" H 6900 2900 50  0001 C CNN
F 3 "" H 6900 2900 50  0001 C CNN
	1    6900 2900
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C961E46
P 6500 2900
F 0 "#PWR?" H 6500 2650 50  0001 C CNN
F 1 "GND" H 6505 2727 50  0000 C CNN
F 2 "" H 6500 2900 50  0001 C CNN
F 3 "" H 6500 2900 50  0001 C CNN
	1    6500 2900
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6500 2850 6500 2900
Wire Wire Line
	6900 2850 6900 2900
Wire Wire Line
	7250 2350 7250 2400
Wire Wire Line
	7250 2150 7250 2100
Wire Wire Line
	6500 2600 6500 2650
Wire Wire Line
	6900 2650 6900 2600
Wire Wire Line
	6900 2600 6500 2600
Wire Wire Line
	7250 2100 6900 2100
Wire Wire Line
	6900 2100 6900 2400
Connection ~ 6900 2600
Wire Wire Line
	6900 2400 6000 2400
Wire Wire Line
	6000 2400 6000 3050
Connection ~ 6900 2400
Wire Wire Line
	6900 2400 6900 2600
Wire Wire Line
	6500 2600 6150 2600
Wire Wire Line
	6150 2600 6150 3050
Connection ~ 6500 2600
Wire Wire Line
	6900 2100 6900 1700
Connection ~ 6900 2100
$Comp
L power:+5V #PWR?
U 1 1 5C972E4F
P 4800 1700
F 0 "#PWR?" H 4800 1550 50  0001 C CNN
F 1 "+5V" H 4815 1873 50  0000 C CNN
F 2 "" H 4800 1700 50  0001 C CNN
F 3 "" H 4800 1700 50  0001 C CNN
	1    4800 1700
	1    0    0    -1  
$EndComp
$Comp
L power:-5V #PWR?
U 1 1 5C972EE5
P 6900 1700
F 0 "#PWR?" H 6900 1800 50  0001 C CNN
F 1 "-5V" H 6915 1873 50  0000 C CNN
F 2 "" H 6900 1700 50  0001 C CNN
F 3 "" H 6900 1700 50  0001 C CNN
	1    6900 1700
	1    0    0    -1  
$EndComp
Text GLabel 2600 3300 0    50   Input ~ 0
DACL+
Text GLabel 2600 3650 0    50   Input ~ 0
DACL-
Text GLabel 2600 4000 0    50   Input ~ 0
DACR-
Text GLabel 2600 4350 0    50   Input ~ 0
DACR+
$EndSCHEMATC
