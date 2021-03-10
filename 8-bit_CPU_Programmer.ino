/*
 SD card attached to SPI bus with following setup:
 ** MOSI - pin 11
 ** MISO - pin 12
 ** CLK - pin 13
 ** CS - pin 4
*/

#include <SPI.h>
#include <SD.h>

#define ADDR_SER 10
#define ADDR_LATCH 9
#define ADDR_SRCLK 8

#define DATA_SER 7
#define DATA_LATCH 6
#define DATA_SRCLK 5

#define WRITE_EN 3

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
  
  // Open serial communications and wait for port to open:
  Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }


  Serial.print("Initializing SD card...");

  if (!SD.begin(4)) {
    Serial.println("initialization failed!");
    while (1);
  }
  Serial.println("initialization done.");

  File machineCodeHex = SD.open("MACHIN~1.HEX");
  if (machineCodeHex) {
    while (machineCodeHex.available()) {
      byte address = machineCodeHex.read();
      byte data = machineCodeHex.read();

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
      delay(250);
    }
    machineCodeHex.close();
  }
}

void loop() {
  // nothing happens after setup
}
