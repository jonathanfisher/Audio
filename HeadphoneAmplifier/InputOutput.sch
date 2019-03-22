EESchema Schematic File Version 4
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Notes Line
	1400 1800 1400 6400
Wire Notes Line
	1400 6400 5000 6400
Wire Notes Line
	5000 6400 5000 1800
Wire Notes Line
	5000 1800 1400 1800
Text Notes 2900 2150 0    197  ~ 0
INPUT
$Comp
L Connector:Conn_01x06_Female J?
U 1 1 5CA51497
P 2500 2650
F 0 "J?" H 2527 2626 50  0000 L CNN
F 1 "Conn_01x06_Female" H 2527 2535 50  0000 L CNN
F 2 "" H 2500 2650 50  0001 C CNN
F 3 "~" H 2500 2650 50  0001 C CNN
	1    2500 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 2450 2300 2450
Wire Wire Line
	2250 2550 2300 2550
Wire Wire Line
	2250 2650 2300 2650
Wire Wire Line
	2250 2750 2300 2750
Wire Wire Line
	2250 2850 2300 2850
Wire Wire Line
	2250 2950 2300 2950
Text GLabel 2250 2850 0    39   Input ~ 0
GND
Text GLabel 2250 2950 0    39   Input ~ 0
VBUS
Text GLabel 2250 2750 0    39   Input ~ 0
DACR-
Text GLabel 2250 2650 0    39   Input ~ 0
DACR+
Text GLabel 2250 2550 0    39   Input ~ 0
DACL-
Text GLabel 2250 2450 0    39   Input ~ 0
DACL+
$Comp
L Connector:AudioJack3 J?
U 1 1 5CA541D4
P 7800 3250
AR Path="/5CA525A7/5CA541D4" Ref="J?"  Part="1" 
AR Path="/5CA51422/5CA541D4" Ref="J?"  Part="1" 
F 0 "J?" H 7520 3275 50  0000 R CNN
F 1 "AudioJack3" H 7520 3184 50  0000 R CNN
F 2 "" H 7800 3250 50  0001 C CNN
F 3 "~" H 7800 3250 50  0001 C CNN
	1    7800 3250
	-1   0    0    -1  
$EndComp
Text Notes 7900 3900 0    50   ~ 0
TRS Plug\nT = Tip = Left\nR = Ring = Right\nS = Sleeve = GND
$Comp
L power:GND #PWR?
U 1 1 5CA541DC
P 7800 2850
AR Path="/5CA525A7/5CA541DC" Ref="#PWR?"  Part="1" 
AR Path="/5CA51422/5CA541DC" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7800 2600 50  0001 C CNN
F 1 "GND" H 7805 2677 50  0000 C CNN
F 2 "" H 7800 2850 50  0001 C CNN
F 3 "" H 7800 2850 50  0001 C CNN
	1    7800 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 3150 7500 3150
Wire Wire Line
	7500 3150 7500 2700
Wire Wire Line
	7500 2700 7800 2700
Wire Wire Line
	7800 2700 7800 2850
Wire Wire Line
	7250 3350 7600 3350
Wire Wire Line
	7250 3250 7600 3250
Wire Notes Line
	5750 1800 5750 6400
Wire Notes Line
	5750 6400 9350 6400
Wire Notes Line
	9350 6400 9350 1800
Wire Notes Line
	9350 1800 5750 1800
Text Notes 7250 2150 0    197  ~ 0
OUTPUT
Text GLabel 7250 3350 0    39   Input ~ 0
AUDIO_OUT_L
Text GLabel 7250 3250 0    39   Input ~ 0
AUDIO_OUT_R
$EndSCHEMATC
