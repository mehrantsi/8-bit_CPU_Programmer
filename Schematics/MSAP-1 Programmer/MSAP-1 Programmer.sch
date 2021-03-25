EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "MSAP-1 Programmer"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Module:Arduino_Nano_v3.x A1
U 1 1 605C5E25
P 5400 3550
F 0 "A1" H 5300 2600 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 5000 2500 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 5400 3550 50  0001 C CIN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 5400 3550 50  0001 C CNN
	1    5400 3550
	-1   0    0    -1  
$EndComp
$Comp
L 74xx:74HC595 U2
U 1 1 605C9D70
P 7250 4550
F 0 "U2" H 7450 5200 50  0000 C CNN
F 1 "74HC595" H 7450 5100 50  0000 C CNN
F 2 "" H 7250 4550 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 7250 4550 50  0001 C CNN
	1    7250 4550
	1    0    0    -1  
$EndComp
$Comp
L Programmer:SD_Card M1
U 1 1 605E04AF
P 3600 3550
F 0 "M1" H 3850 3850 50  0000 C CNN
F 1 "SD_Card" H 3750 3750 50  0000 C CNN
F 2 "" H 3800 3750 50  0001 C CNN
F 3 "" H 3800 3750 50  0001 C CNN
	1    3600 3550
	-1   0    0    1   
$EndComp
$Comp
L Programmer:SSD1306 M2
U 1 1 605E286A
P 3600 4500
F 0 "M2" H 3350 4100 50  0000 L CNN
F 1 "SSD1306" H 3350 4200 50  0000 L CNN
F 2 "" H 3600 4750 50  0001 C CNN
F 3 "" H 3600 4750 50  0001 C CNN
	1    3600 4500
	1    0    0    -1  
$EndComp
Entry Wire Line
	8000 2500 8100 2600
Entry Wire Line
	8000 2600 8100 2700
Entry Wire Line
	8000 2700 8100 2800
Entry Wire Line
	8000 2800 8100 2900
Entry Wire Line
	8000 2900 8100 3000
Entry Wire Line
	8000 3000 8100 3100
Entry Wire Line
	8000 3100 8100 3200
Entry Wire Line
	8000 3200 8100 3300
Entry Wire Line
	8000 4150 8100 4250
Entry Wire Line
	8000 4250 8100 4350
Entry Wire Line
	8000 4350 8100 4450
Entry Wire Line
	8000 4450 8100 4550
Entry Wire Line
	8000 4550 8100 4650
Entry Wire Line
	8000 4650 8100 4750
Entry Wire Line
	8000 4750 8100 4850
Entry Wire Line
	8000 4850 8100 4950
Text Notes 8150 2500 0    50   ~ 0
addr[0...7]
Text Notes 8150 4150 0    50   ~ 0
data[0...7]
$Comp
L 74xx:74HC595 U1
U 1 1 605C8A1A
P 7250 2900
F 0 "U1" H 7450 3550 50  0000 C CNN
F 1 "74HC595" H 7450 3450 50  0000 C CNN
F 2 "" H 7250 2900 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 7250 2900 50  0001 C CNN
	1    7250 2900
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 605F81BB
P 7250 2050
F 0 "#PWR?" H 7250 1900 50  0001 C CNN
F 1 "VCC" H 7265 2223 50  0000 C CNN
F 2 "" H 7250 2050 50  0001 C CNN
F 3 "" H 7250 2050 50  0001 C CNN
	1    7250 2050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 605FD5E2
P 7250 5450
F 0 "#PWR?" H 7250 5200 50  0001 C CNN
F 1 "GND" H 7255 5277 50  0000 C CNN
F 2 "" H 7250 5450 50  0001 C CNN
F 3 "" H 7250 5450 50  0001 C CNN
	1    7250 5450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 605CA909
P 6750 3800
F 0 "C1" H 6800 3900 50  0000 L CNN
F 1 "10 nF" H 6800 3700 50  0000 L CNN
F 2 "" H 6788 3650 50  0001 C CNN
F 3 "~" H 6750 3800 50  0001 C CNN
	1    6750 3800
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 60603B97
P 5200 2050
F 0 "#PWR?" H 5200 1900 50  0001 C CNN
F 1 "VCC" H 5215 2223 50  0000 C CNN
F 2 "" H 5200 2050 50  0001 C CNN
F 3 "" H 5200 2050 50  0001 C CNN
	1    5200 2050
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 6060517B
P 4250 3000
F 0 "#PWR?" H 4250 2850 50  0001 C CNN
F 1 "VCC" H 4265 3173 50  0000 C CNN
F 2 "" H 4250 3000 50  0001 C CNN
F 3 "" H 4250 3000 50  0001 C CNN
	1    4250 3000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6060E8D0
P 2800 4300
F 0 "#PWR?" H 2800 4050 50  0001 C CNN
F 1 "GND" H 2805 4127 50  0000 C CNN
F 2 "" H 2800 4300 50  0001 C CNN
F 3 "" H 2800 4300 50  0001 C CNN
	1    2800 4300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 606127FA
P 5300 4950
F 0 "#PWR?" H 5300 4700 50  0001 C CNN
F 1 "GND" H 5305 4777 50  0000 C CNN
F 2 "" H 5300 4950 50  0001 C CNN
F 3 "" H 5300 4950 50  0001 C CNN
	1    5300 4950
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 605CCA5C
P 3600 2900
F 0 "SW1" H 3600 3185 50  0000 C CNN
F 1 "SW_Push" H 3600 3094 50  0000 C CNN
F 2 "" H 3600 3100 50  0001 C CNN
F 3 "~" H 3600 3100 50  0001 C CNN
	1    3600 2900
	1    0    0    -1  
$EndComp
Text GLabel 8100 1700 2    50   Input ~ 0
WE
Text GLabel 8100 1550 2    50   Input ~ 0
PM
Wire Wire Line
	5900 3950 6450 3950
Wire Wire Line
	6450 3950 6450 2500
Wire Wire Line
	6450 2500 6850 2500
Wire Wire Line
	5900 3850 6500 3850
Wire Wire Line
	6500 3850 6500 3000
Wire Wire Line
	6500 3000 6850 3000
Wire Wire Line
	5900 3750 6550 3750
Wire Wire Line
	6550 3750 6550 2700
Wire Wire Line
	6550 2700 6850 2700
Wire Wire Line
	5900 3650 6350 3650
Wire Wire Line
	6350 3650 6350 4150
Wire Wire Line
	6350 4150 6850 4150
Wire Wire Line
	5900 3550 6300 3550
Wire Wire Line
	6300 3550 6300 4650
Wire Wire Line
	6300 4650 6850 4650
Wire Wire Line
	5900 3450 6250 3450
Wire Wire Line
	6250 3450 6250 4350
Wire Wire Line
	6250 4350 6850 4350
Wire Wire Line
	7650 2500 8000 2500
Wire Wire Line
	7650 2600 8000 2600
Wire Wire Line
	7650 2700 8000 2700
Wire Wire Line
	7650 2800 8000 2800
Wire Wire Line
	7650 2900 8000 2900
Wire Wire Line
	7650 3000 8000 3000
Wire Wire Line
	7650 3100 8000 3100
Wire Wire Line
	7650 3200 8000 3200
Wire Wire Line
	7650 4150 8000 4150
Wire Wire Line
	7650 4250 8000 4250
Wire Wire Line
	7650 4350 8000 4350
Wire Wire Line
	7650 4450 8000 4450
Wire Wire Line
	7650 4550 8000 4550
Wire Wire Line
	7650 4650 8000 4650
Wire Wire Line
	7650 4750 8000 4750
Wire Wire Line
	7650 4850 8000 4850
Wire Wire Line
	7250 3600 7250 3700
Wire Wire Line
	6950 3700 6950 4000
Wire Wire Line
	7250 5350 7250 5450
Wire Wire Line
	7250 5250 7250 5350
Connection ~ 7250 5350
Wire Wire Line
	7250 5350 6850 5350
Wire Wire Line
	6750 4000 6750 5350
Wire Wire Line
	6950 4000 6750 4000
Connection ~ 6750 4000
Wire Wire Line
	6750 3950 6750 4000
Wire Wire Line
	6750 2200 7250 2200
Wire Wire Line
	7250 2300 7250 2200
Wire Wire Line
	7250 2200 7250 2050
Connection ~ 7250 2200
Wire Wire Line
	4250 3000 4250 3600
Wire Wire Line
	4250 3600 3900 3600
Wire Wire Line
	3550 4150 3550 4050
Wire Wire Line
	3550 4050 4250 4050
Wire Wire Line
	4250 4050 4250 3600
Connection ~ 4250 3600
Wire Wire Line
	3450 4150 3450 4050
Wire Wire Line
	3450 4050 2800 4050
Wire Wire Line
	2800 4050 2800 4300
Wire Wire Line
	3900 3650 3900 3950
Wire Wire Line
	3900 3950 2800 3950
Wire Wire Line
	2800 3950 2800 4050
Connection ~ 2800 4050
Wire Wire Line
	4900 3550 4550 3550
Wire Wire Line
	4550 3550 4550 3150
Wire Wire Line
	4550 3150 3950 3150
Wire Wire Line
	3950 3150 3950 2900
Wire Wire Line
	3950 2900 3800 2900
Wire Wire Line
	5200 2050 5200 2550
Wire Wire Line
	3400 2900 2800 2900
Wire Wire Line
	2800 2900 2800 3950
Connection ~ 2800 3950
Wire Wire Line
	6950 3700 7250 3700
Wire Wire Line
	6750 2200 6750 3600
Wire Wire Line
	7250 3950 7250 3800
Wire Wire Line
	7250 3800 7050 3800
Wire Wire Line
	7050 3800 7050 3600
Wire Wire Line
	7050 3600 6750 3600
Connection ~ 6750 3600
Wire Wire Line
	6750 3600 6750 3650
Wire Wire Line
	5900 4250 6000 4250
Wire Wire Line
	6000 4250 6000 4700
Wire Wire Line
	6000 4700 4000 4700
Wire Wire Line
	4000 4700 4000 3450
Wire Wire Line
	4000 3450 3900 3450
Wire Wire Line
	5900 3350 6050 3350
Wire Wire Line
	6050 3350 6050 4750
Wire Wire Line
	6050 4750 4050 4750
Wire Wire Line
	4050 4750 4050 3400
Wire Wire Line
	4050 3400 3900 3400
Wire Wire Line
	5900 4150 6100 4150
Wire Wire Line
	6100 4150 6100 4800
Wire Wire Line
	3950 4800 3950 3550
Wire Wire Line
	3950 3550 3900 3550
Wire Wire Line
	3900 3500 4100 3500
Wire Wire Line
	4100 3500 4100 4650
Wire Wire Line
	4100 4650 5950 4650
Wire Wire Line
	5950 4650 5950 4050
Wire Wire Line
	5950 4050 5900 4050
Wire Wire Line
	4900 3950 4650 3950
Wire Wire Line
	4650 3950 4650 4150
Wire Wire Line
	4650 4150 3750 4150
Wire Wire Line
	4900 4050 4600 4050
Wire Wire Line
	4600 4050 4600 4100
Wire Wire Line
	4600 4100 3650 4100
Wire Wire Line
	3650 4100 3650 4150
Wire Wire Line
	5900 3250 6200 3250
Wire Wire Line
	6200 3250 6200 1700
Wire Wire Line
	6200 1700 8100 1700
Wire Wire Line
	4900 3650 4700 3650
Wire Wire Line
	4700 3650 4700 1550
Wire Wire Line
	4700 1550 8100 1550
Wire Wire Line
	3950 4800 6100 4800
Wire Wire Line
	5300 4550 5300 4950
Wire Wire Line
	6850 4750 6850 5350
Connection ~ 6850 5350
Wire Wire Line
	6850 5350 6750 5350
Wire Wire Line
	6850 3100 6600 3100
Wire Wire Line
	6600 3100 6600 4000
Wire Wire Line
	6600 4000 6750 4000
NoConn ~ 7650 5050
NoConn ~ 7650 3400
NoConn ~ 5900 3150
NoConn ~ 5900 3050
NoConn ~ 5900 2950
NoConn ~ 4900 4250
NoConn ~ 4900 4150
NoConn ~ 5400 4550
NoConn ~ 4900 3350
NoConn ~ 4900 3050
NoConn ~ 4900 2950
NoConn ~ 5300 2550
NoConn ~ 5500 2550
Wire Bus Line
	8100 4100 8100 5050
Wire Bus Line
	8100 2450 8100 3400
$EndSCHEMATC
