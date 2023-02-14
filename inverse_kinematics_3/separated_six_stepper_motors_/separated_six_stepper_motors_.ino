// include the library code:
//#include <LiquidCrystal.h>

// initialize the library by associating any needed LCD interface pin
// with the arduino pin number it is connected to
//const int rs = 13, en = 12, d4 = 5, d5 = 4, d6 = 3, d7 = 2;
//LiquidCrystal lcd(rs, en, d4, d5, d6, d7);

const int stepPin_1 = 2; 
const int dirPin_1 = 3;

const int stepPin_2 = 4; 
const int dirPin_2 = 5;

const int stepPin_3 = 6; 
const int dirPin_3 = 7;

const int stepPin_4 = 8; 
const int dirPin_4 = 9;

const int stepPin_5 = 10; 
const int dirPin_5 = 11;

const int stepPin_6 = 12; 
const int dirPin_6 = 13;


volatile  float th[6];
void setup()
{
Serial.begin(115200);
  /*// set up the LCD's number of columns and rows:
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
        lcd.clear();*/

  pinMode(stepPin_1,OUTPUT); 
  pinMode(dirPin_1,OUTPUT);
  pinMode(stepPin_2,OUTPUT); 
  pinMode(dirPin_2,OUTPUT);
  pinMode(stepPin_3,OUTPUT); 
  pinMode(dirPin_3,OUTPUT);
  pinMode(stepPin_4,OUTPUT); 
  pinMode(dirPin_4,OUTPUT);
  pinMode(stepPin_5,OUTPUT); 
  pinMode(dirPin_5,OUTPUT);
  pinMode(stepPin_6,OUTPUT); 
  pinMode(dirPin_6,OUTPUT);

  

       
    
    
      /*  lcd.setCursor(0, 0);  lcd.print(th[6]);
        lcd.setCursor(6, 0);  lcd.print(th[6]);
        lcd.setCursor(12, 0); lcd.print(th[6]);
        lcd.setCursor(0, 1);  lcd.print(th[6]);
        lcd.setCursor(6, 1);  lcd.print(th[6]);
        lcd.setCursor(12,1);  lcd.print(th[6]); */
        
    
         
}

void loop()
{

if(Serial.available() >= 5) {

    for(int i = 1; i < 7; i ++) {

        th[i] = Serial.parseFloat();
    }
    Serial.flush();


if(th[1] > 0)
  {
    digitalWrite(dirPin_1,HIGH); 
   for(int x = 0; x < th[1]; x++)
  {
    digitalWrite(stepPin_1,HIGH); 
    delayMicroseconds(100); 
    digitalWrite(stepPin_1,LOW); 
    delayMicroseconds(100); 
   }
  //delay(1000); 
  }

  // Enables the motor to move in the opposite direction
  else 
   {
    th[1] = th[1]*(-1);
    digitalWrite(dirPin_1,LOW); 
    for(int x = 0; x < th[1]; x++)
    {
    digitalWrite(stepPin_1,HIGH); 
    delayMicroseconds(100); 
    digitalWrite(stepPin_1,LOW); 
    delayMicroseconds(100); 
    }
  //delay(1000); 
  }
///////////////////////////////////////////////////////////////////////////////////////////


  if(th[2] > 0)
  {
    digitalWrite(dirPin_2,HIGH); 
   for(int x = 0; x < th[2]; x++)
  {
    digitalWrite(stepPin_2,HIGH); 
    delayMicroseconds(100); 
    digitalWrite(stepPin_2,LOW); 
    delayMicroseconds(100); 
   }
  //delay(1000); 
  }

  // Enables the motor to move in the opposite direction
  else 
   {
    th[2] = th[2]*(-1);
    digitalWrite(dirPin_2,LOW); 
    for(int x = 0; x < th[2]; x++)
    {
    digitalWrite(stepPin_2,HIGH); 
    delayMicroseconds(100); 
    digitalWrite(stepPin_2,LOW); 
    delayMicroseconds(100); 
    }
 // delay(1000); 
  }
//////////////////////////////////////////////////////////////////////////////////////


  if(th[3] > 0)
  {
    digitalWrite(dirPin_3,HIGH); 
   for(int x = 0; x < th[3]; x++)
  {
    digitalWrite(stepPin_3,HIGH); 
    delayMicroseconds(100); 
    digitalWrite(stepPin_3,LOW); 
    delayMicroseconds(100); 
   }
  //delay(1000); 
  }

  // Enables the motor to move in the opposite direction
  else 
   {
    th[3] = th[3]*(-1);
    digitalWrite(dirPin_3,LOW); 
    for(int x = 0; x < th[3]; x++)
    {
    digitalWrite(stepPin_3,HIGH); 
    delayMicroseconds(100); 
    digitalWrite(stepPin_3,LOW); 
    delayMicroseconds(100); 
    }
  //delay(1000); 
  }
///////////////////////////////////////////////////////////////////////////////////////////////////////////////


  if(th[4] > 0)
  {
    digitalWrite(dirPin_4,HIGH); 
   for(int x = 0; x < th[4]; x++)
  {
    digitalWrite(stepPin_4,HIGH); 
    delayMicroseconds(100); 
    digitalWrite(stepPin_4,LOW); 
    delayMicroseconds(100); 
   }
  //delay(1000); 
  }

  // Enables the motor to move in the opposite direction
  else 
   {
    th[4] = th[4]*(-1);
    digitalWrite(dirPin_4,LOW); 
    for(int x = 0; x < th[4]; x++)
    {
    digitalWrite(stepPin_4,HIGH); 
    delayMicroseconds(100); 
    digitalWrite(stepPin_4,LOW); 
    delayMicroseconds(100); 
    }
  //delay(1000); 
  }
////////////////////////////////////////////////////////////////////////////////////////////////////////


  if(th[5] > 0)
  {
    digitalWrite(dirPin_5,HIGH); 
   for(int x = 0; x < th[5]; x++)
  {
    digitalWrite(stepPin_5,HIGH); 
    delayMicroseconds(100); 
    digitalWrite(stepPin_5,LOW); 
    delayMicroseconds(100); 
   }
  //delay(1000); 
  }

  // Enables the motor to move in the opposite direction
  else 
   {
    th[5] = th[5]*(-1);
    digitalWrite(dirPin_5,LOW); 
    for(int x = 0; x < th[5]; x++)
    {
    digitalWrite(stepPin_5,HIGH); 
    delayMicroseconds(100); 
    digitalWrite(stepPin_5,LOW); 
    delayMicroseconds(100); 
    }
  //delay(1000); 
  }
///////////////////////////////////////////////////////////////////////////////////////////


  if(th[6] > 0)
  {
    digitalWrite(dirPin_6,HIGH); 
   for(int x = 0; x < th[6]; x++)
  {
    digitalWrite(stepPin_6,HIGH); 
    delayMicroseconds(100); 
    digitalWrite(stepPin_6,LOW); 
    delayMicroseconds(100); 
   }
  //delay(1000); 
  }

  // Enables the motor to move in the opposite direction
  else 
   {
    th[6] = th[6]*(-1);
    digitalWrite(dirPin_6,LOW); 
    for(int x = 0; x < th[6]; x++)
    {
    digitalWrite(stepPin_6,HIGH); 
    delayMicroseconds(100); 
    digitalWrite(stepPin_6,LOW); 
    delayMicroseconds(100); 
    }
  //delay(1000); 
  }
}
    }
