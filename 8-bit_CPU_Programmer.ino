/*
 SD card attached to SPI bus with following setup:
 ** MOSI - pin 11
 ** MISO - pin 12
 ** CLK - pin 13
 ** CS - pin 4
*/

#include <SPI.h>
#include <SD.h>
#include <Wire.h>
#include "SSD1306Ascii.h"
#include "SSD1306AsciiWire.h"

#define ADDR_SER 10
#define ADDR_LATCH 9
#define ADDR_SRCLK 8

#define DATA_SER 7
#define DATA_LATCH 6
#define DATA_SRCLK 5

#define WRITE_EN 3

#define SWITCH A0
#define MODE A1

#define OLED_I2C_ADDRESS 0x3C
SSD1306AsciiWire oled;

#define ROWS 3

enum ProgrammerState { ProgramMode, RunMode };

bool _prgStart = false;
bool _prgMode = false;
int _page = 0;
ProgrammerState _state;

void setup() {
  // Initialize pins
  digitalWrite(WRITE_EN, HIGH);
  pinMode (WRITE_EN, OUTPUT);

  pinMode (ADDR_SER, OUTPUT);
  pinMode (ADDR_LATCH, OUTPUT);
  pinMode (ADDR_SRCLK, OUTPUT);

  pinMode (DATA_SER, OUTPUT);
  pinMode (DATA_LATCH, OUTPUT);
  pinMode (DATA_SRCLK, OUTPUT);

  pinMode (SWITCH, INPUT_PULLUP);
  pinMode (MODE, INPUT_PULLUP);

  Wire.begin();
  Wire.setClock(400000L);
  
  // Open serial communications and wait for port to open:
  Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }

  Serial.print("Initializing OLED...");
 
  oled.begin(&Adafruit128x64, OLED_I2C_ADDRESS);
  
  oled.setFont(ZevvPeep8x16);
  oled.clear();
  oled.setScrollMode(SCROLL_MODE_AUTO);
  
  oled.println("Initializing");
  oled.println("SD card...");
  Serial.println("Initializing SD card...");

  if (!SD.begin(4)) {
    oled.clear();
    oled.println("SD");
    oled.println("initialization");
    oled.println("failed!");
    Serial.println("SD initialization failed!");
    while (1);
  }
  oled.clear();
  oled.println("Initialization");
  oled.println("done.");
  Serial.println("Initialization done.");
  
  oled.clear();
  oled.println("Press button");
  oled.println("to program!");
}

void startProgramming() {
  File machineCodeHex = SD.open("MACHIN~1.HEX");
  if (machineCodeHex) {
    while (machineCodeHex.available()) {
      byte address = machineCodeHex.read();
      byte data = machineCodeHex.read();
  
      char buf[10];
      sprintf(buf, "0x%02x: 0x%02x", address, data);
      oled.println(buf);
  
      shiftOut(ADDR_SER, ADDR_SRCLK, MSBFIRST, address);
      digitalWrite(ADDR_LATCH, LOW);
      digitalWrite(ADDR_LATCH, HIGH);
      digitalWrite(ADDR_LATCH, LOW);
      
      shiftOut(DATA_SER, DATA_SRCLK, MSBFIRST, data);
      digitalWrite(DATA_LATCH, LOW);
      digitalWrite(DATA_LATCH, HIGH);
      digitalWrite(DATA_LATCH, LOW);
      
      digitalWrite(WRITE_EN, LOW);
      delay(1);
      digitalWrite(WRITE_EN, HIGH);
      delay(10);
    }
    oled.println("Done!");
    oled.println("Press button");
    oled.println("to re-program!");
    machineCodeHex.close();
  }
  else {
    oled.clear();
    oled.println("machinecode.hex");
    oled.println("not found!");
  }
  _prgStart = false;
}

void scrollPage() {
  File machineCodeHex = SD.open("MACHIN~1.HEX");
  if (machineCodeHex) {
    int startPos = _page * ROWS * 2;
    if (startPos < machineCodeHex.size()) {
      machineCodeHex.seek(startPos);
      oled.clear();
      int wordsToRead = min(machineCodeHex.available() / 2, ROWS);
      for (int i = 0; i < wordsToRead; i++) {
        byte address = machineCodeHex.read();
        byte data = machineCodeHex.read();
        char buf[10];
        sprintf(buf, "0x%02x: 0x%02x", address, data);
        oled.println(buf);
      }
      if(machineCodeHex.available() == 0) {
        oled.println("Done!");
        _page = 0;
      }
      else {
        _page++;
      }
    }
    machineCodeHex.close();
    _prgStart = false;
  }
  else {
    oled.clear();
    oled.println("machinecode.hex");
    oled.println("not found!");
  }
}

void loop() {
  if (_prgStart) return;
  _prgStart = !digitalRead(SWITCH);
  _prgMode = digitalRead(MODE);
  if (_prgStart && _prgMode) {
    startProgramming();
  }
  else if (_prgStart && !_prgMode) {
    scrollPage();
  }
  else if (!_prgStart && !_prgMode) {
    if (_state != RunMode) {
      oled.clear();
      oled.println("Press button");
      oled.println("to review!");
      _state = RunMode;
    }
  }
  else if (!_prgStart && _prgMode) {
    if (_state != ProgramMode) {
      oled.clear();
      oled.println("Press button");
      oled.println("to program!");
      _state = ProgramMode;
    }
  }
  delay(20);
}
