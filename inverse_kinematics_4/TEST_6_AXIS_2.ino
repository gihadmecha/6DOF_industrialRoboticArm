/* 6DOF  Manipulator
 serial code
 */

//used libraries
#include <AccelStepper.h>
#include <MultiStepper.h>

//global variables
volatile long   rec_data[6];

#define M1_Min_Limit 0
#define M1_Max_Limit +6000
#define M2_Min_Limit 0
#define M2_Max_Limit 60000
#define M3_Min_Limit 0
#define M3_Max_Limit 60000
#define M4_Min_Limit -3000
#define M4_Max_Limit 3000
#define M5_Min_Limit -50
#define M5_Max_Limit 500
#define M6_Min_Limit 0
#define M6_Max_Limit 2000
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

//define motor object
AccelStepper stepper1(AccelStepper::DRIVER, PUL1, DIR1);
AccelStepper stepper2(AccelStepper::DRIVER, PUL2, DIR2);
AccelStepper stepper3(AccelStepper::DRIVER, PUL3, DIR3);
AccelStepper stepper4(AccelStepper::DRIVER, PUL4, DIR4);
AccelStepper stepper5(AccelStepper::DRIVER, PUL5, DIR5);
AccelStepper stepper6(AccelStepper::DRIVER, PUL6, DIR6);

void setup() {
  
// define serial && user interface 
  Serial.begin(115200);

// Input&Output Pins
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

//initial parameters

    stepper1.setCurrentPosition(0);  // Set the current position as zero for now
    stepper1.setMaxSpeed(1000.0);
    stepper1.setAcceleration(800.0);

    stepper2.setCurrentPosition(0);  // Set the current position as zero for now
    stepper2.setMaxSpeed(3000.0);
    stepper2.setAcceleration(2000.0);
 
    
    stepper3.setCurrentPosition(0);  // Set the current position as zero for now
    stepper3.setMaxSpeed(4000.0);
    stepper3.setAcceleration(5000.0);
   stepper3.setPinsInverted(true, false, false); 
   
    stepper4.setCurrentPosition(0);  // Set the current position as zero for now
    stepper4.setMaxSpeed(2000.0);
    stepper4.setAcceleration(1500.0);

    stepper5.setCurrentPosition(0);  // Set the current position as zero for now
    stepper5.setMaxSpeed(1500.0);
    stepper5.setAcceleration(1000.0);
    
    stepper6.setCurrentPosition(0);  // Set the current position as zero for now
    stepper6.setMaxSpeed(2000.0);
    stepper6.setAcceleration(2200.0);

 //homing_cycle();

}

void loop() {
//read serial and move motors depend on it
if(Serial.available()>=5 ) {

    for(int i = 0; i < 6; i ++) {

    rec_data[i] = Serial.parseFloat();
    }

    Serial.flush();
}

   //motor 1    
  if(rec_data[0]>=M1_Min_Limit && rec_data[0]<=M1_Max_Limit){
 if( rec_data[0]>=stepper1.currentPosition()) stepper1.runToNewPosition(rec_data[0]);
 else if( rec_data[0]<stepper1.currentPosition()) stepper1.move(rec_data[0]-stepper1.currentPosition());
}
   //motor 2    
   
  if(rec_data[1]>=M2_Min_Limit && rec_data[1]<=M2_Max_Limit){
 if( rec_data[1]>=stepper2.currentPosition()) stepper2.runToNewPosition(rec_data[1]);
 else if( rec_data[1]<stepper2.currentPosition()) stepper2.move(rec_data[1]-stepper2.currentPosition());
}
   //motor 3    
  if(rec_data[2]>=M3_Min_Limit && rec_data[2]<=M3_Max_Limit){
 if( rec_data[2]>=stepper3.currentPosition()) stepper3.runToNewPosition(rec_data[2]);
 else if( rec_data[2]<stepper3.currentPosition()) stepper3.move(rec_data[2]-stepper3.currentPosition());
}
   //motor 4 
  if(rec_data[3]>=M4_Min_Limit && rec_data[3]<=M4_Max_Limit){
 if( rec_data[3]>=stepper4.currentPosition()) stepper4.runToNewPosition(rec_data[3]);
 else if( rec_data[3]<stepper4.currentPosition()) stepper4.move(rec_data[3]-stepper4.currentPosition());
}
   //motor 5
if(rec_data[4]>=M5_Min_Limit && rec_data[4]<=M5_Max_Limit){
 if( rec_data[4]>=stepper5.currentPosition()) stepper5.runToNewPosition(rec_data[4]);
 else if( rec_data[4]<stepper5.currentPosition()) stepper5.move(rec_data[4]-stepper5.currentPosition());
}
   //motor 6
if(rec_data[5]>=M6_Min_Limit && rec_data[5]<=M6_Max_Limit){
 if( rec_data[5]>=stepper6.currentPosition()) stepper6.runToNewPosition(rec_data[5]);
 else if( rec_data[5]<stepper6.currentPosition()) stepper6.move(rec_data[5]-stepper6.currentPosition());
}

stepper1.run();
stepper2.run();
stepper3.run();
stepper4.run();
stepper5.run();
stepper6.run();

    

}
