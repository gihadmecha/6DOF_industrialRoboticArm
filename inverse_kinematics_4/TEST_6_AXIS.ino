/* 6DOF  Manipulator
 serial code
 */

#include <AccelStepper.h>
#include <MultiStepper.h>

#define motor1_steps  100
#define motor2_steps  15000
#define motor3_steps  2000
#define motor4_steps  100
#define motor5_steps  100
#define motor6_steps  9000

//define motor pins
const int PUL1=24; //Motor 1 Pulse Pin
const int DIR1=30;//Motor  1  Direction Pin 
const int PUL2=25; //Motor 2 Pulse Pin
const int DIR2=31;//Motor  2  Direction Pin 
const int PUL3=26; //Motor 3 Pulse Pin
const int DIR3=32;//Motor  3  Direction Pin 
const int PUL4=2; //Motor  4 Pulse Pin
const int DIR4=5;//Motor   4  Direction Pin 
const int PUL5=3; //Motor  5 Pulse Pin
const int DIR5=6;//Motor   5  Direction Pin 
const int PUL6=4; //Motor  6 Pulse Pin
const int DIR6=7;//Motor   6  Direction Pin 
AccelStepper stepper1(AccelStepper::DRIVER, PUL1, DIR1);
AccelStepper stepper2(AccelStepper::DRIVER, PUL2, DIR2);
AccelStepper stepper3(AccelStepper::DRIVER, PUL3, DIR3);
AccelStepper stepper4(AccelStepper::DRIVER, PUL4, DIR4);
AccelStepper stepper5(AccelStepper::DRIVER, PUL5, DIR5);
AccelStepper stepper6(AccelStepper::DRIVER, PUL6, DIR6);

//MultiStepper steppers;
void setup() {
  pinMode (PUL1, OUTPUT);//Set Pulse Pin as Ouput
  pinMode (DIR1, OUTPUT);//Set Direction Pin as Ouput
  pinMode (PUL2, OUTPUT);//Set Pulse Pin as Ouput
  pinMode (DIR2, OUTPUT);//Set Direction Pin as Ouput
  pinMode (PUL3, OUTPUT);//Set Pulse Pin as Ouput
  pinMode (DIR3, OUTPUT);//Set Direction Pin as Ouput
  pinMode (PUL4, OUTPUT);//Set Pulse Pin as Ouput
  pinMode (DIR4, OUTPUT);//Set Direction Pin as Ouput
  pinMode (PUL5, OUTPUT);//Set Pulse Pin as Ouput
  pinMode (DIR5, OUTPUT);//Set Direction Pin as Ouput
  pinMode (PUL6, OUTPUT);//Set Pulse Pin as Ouput
  pinMode (DIR6, OUTPUT);//Set Direction Pin as Ouput

      stepper1.setMaxSpeed(1000.0);
    stepper1.setAcceleration(800.0);
    stepper1.moveTo(700);

      stepper2.setMaxSpeed(3000.0);
    stepper2.setAcceleration(2000.0);
     stepper2.moveTo(12000);

    stepper3.setMaxSpeed(10000.0);
    stepper3.setAcceleration(5000.0);
    stepper3.moveTo(-8000);     //58000

      stepper4.setMaxSpeed(2000.0);
    stepper4.setAcceleration(1500.0);
    stepper4.moveTo(1500);    //6000

          stepper5.setMaxSpeed(1500.0);
    stepper5.setAcceleration(1000.0);
    stepper5.moveTo(100);   //600

          stepper6.setMaxSpeed(2000.0);
    stepper6.setAcceleration(2200.0);
    stepper6.moveTo(10000);  //6000

//      // Then give them to MultiStepper to manage
//  steppers.addStepper(stepper1);
//  steppers.addStepper(stepper2);
//    
}

void loop() {
    // Change direction at the limits
    if (stepper1.distanceToGo() == 0)
        stepper1.moveTo(-stepper1.currentPosition());
    if (stepper2.distanceToGo() == 0)
        stepper2.moveTo(-stepper2.currentPosition());
    if (stepper3.distanceToGo() == 0)
        stepper3.moveTo(-stepper3.currentPosition());  
    if (stepper4.distanceToGo() == 0)
        stepper4.moveTo(-stepper4.currentPosition()); 
    if (stepper5.distanceToGo() == 0)
        stepper5.moveTo(-stepper5.currentPosition());
    if (stepper6.distanceToGo() == 0)
        stepper6.moveTo(-stepper6.currentPosition());
        
       stepper1.run();
       stepper2.run();
       stepper3.run();
         stepper4.run();
         stepper5.run();
         stepper6.run();
    
 
}
