// include the library code:
#include <LiquidCrystal.h>

// initialize the library by associating any needed LCD interface pin
// with the arduino pin number it is connected to
const int rs = 12, en = 11, d4 = 5, d5 = 4, d6 = 3, d7 = 2;
LiquidCrystal lcd(rs, en, d4, d5, d6, d7);


const int ledpin=13;
int recValue;
 volatile  float th[6];
void setup()
{
Serial.begin(115200);
  // set up the LCD's number of columns and rows:
  lcd.begin(16, 2);
  // Print a message to the LCD.
    lcd.setCursor(0, 0);
//  lcd.print("6DOF ARM Robot");
//      lcd.setCursor(0, 1);
//  lcd.print("waiting...!");
//  delay(1000);
      lcd.clear();
             lcd.setCursor(0, 1);
 lcd.print("waiting...!");
        lcd.clear();
}

void loop()
{



if(Serial.available() >= 5) {

    for(int i = 0; i < 6; i ++) {

        th[i] = Serial.parseFloat();
    }
    Serial.flush();
}
       
    
    
        lcd.setCursor(0, 0);  lcd.print(th[0]);
        lcd.setCursor(6, 0);  lcd.print(th[1]);
        lcd.setCursor(12, 0); lcd.print(th[2]);
        lcd.setCursor(0, 1);  lcd.print(th[3]);
        lcd.setCursor(6, 1);  lcd.print(th[4]);
        lcd.setCursor(12,1);  lcd.print(th[5]); 
   
  
    }
