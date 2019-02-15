EESchema Schematic File Version 4
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
Wire Wire Line
	2300 3350 2150 3350
Wire Wire Line
	2300 3450 2150 3450
Text GLabel 2150 3450 0    43   Input ~ 0
XSMT
Wire Wire Line
	2150 3550 2300 3550
Wire Wire Line
	2300 2850 2150 2850
Wire Wire Line
	2150 2950 2300 2950
Wire Wire Line
	2150 3050 2300 3050
Wire Wire Line
	2150 3150 2300 3150
Text GLabel 2150 2850 0    43   Input ~ 0
LRCK
Text GLabel 2150 2950 0    43   Input ~ 0
DIN
Text GLabel 2150 3050 0    43   Input ~ 0
BCK
Text GLabel 2150 3150 0    43   Input ~ 0
SCK
Wire Wire Line
	2150 3250 2300 3250
Text GLabel 2150 3250 0    43   Input ~ 0
FLT
Text GLabel 2150 3350 0    43   Input ~ 0
DEMP
Text GLabel 2150 3550 0    43   Input ~ 0
FMT
$Comp
L Connector:Conn_01x08_Male J?
U 1 1 5C68FD15
P 2500 3150
F 0 "J?" H 2473 3123 50  0000 R CNN
F 1 "Conn_01x08_Male" H 2473 3032 50  0000 R CNN
F 2 "" H 2500 3150 50  0001 C CNN
F 3 "~" H 2500 3150 50  0001 C CNN
	1    2500 3150
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J?
U 1 1 5C690D81
P 2500 3950
F 0 "J?" H 2473 3923 50  0000 R CNN
F 1 "Conn_01x02_Male" H 2473 3832 50  0000 R CNN
F 2 "" H 2500 3950 50  0001 C CNN
F 3 "~" H 2500 3950 50  0001 C CNN
	1    2500 3950
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2200 3950 2300 3950
Wire Wire Line
	2200 4050 2300 4050
Text GLabel 2200 3950 0    43   Output ~ 0
LINE_OUT_L
Text GLabel 2200 4050 0    43   Output ~ 0
LINE_OUT_R
$Comp
L Connector:Conn_01x02_Male J?
U 1 1 5C691218
P 2450 4400
F 0 "J?" H 2423 4373 50  0000 R CNN
F 1 "Conn_01x02_Male" H 2423 4282 50  0000 R CNN
F 2 "" H 2450 4400 50  0001 C CNN
F 3 "~" H 2450 4400 50  0001 C CNN
	1    2450 4400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2150 4400 2250 4400
Wire Wire Line
	2150 4500 2250 4500
Text GLabel 2150 4400 0    43   Input ~ 0
5V
Text GLabel 2150 4500 0    43   Input ~ 0
GND
$EndSCHEMATC
