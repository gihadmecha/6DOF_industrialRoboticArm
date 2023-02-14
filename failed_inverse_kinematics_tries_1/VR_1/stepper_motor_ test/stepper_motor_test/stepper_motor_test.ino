// defines pins numbers
const int stepPin = 3; 
const int dirPin = 4;

float angle = 360 ;                //user input
float degree_per_step = 1.8 ;      //according to your motor
float counter ;

//float velocity = 1000;
//float delay_time = (1.8*60*1000000)/(velocity*360*16); 
 
void setup() {
  
  pinMode(stepPin,OUTPUT); 
  pinMode(dirPin,OUTPUT);
}

void loop() {

  // Enables the motor to move in a particular direction
  if(angle > 0)
  {
    counter = (angle/(degree_per_step/32))/2;
    digitalWrite(dirPin,HIGH); 
   for(int x = 0; x < counter; x++)
  {
    digitalWrite(stepPin,HIGH); 
    delayMicroseconds(100); 
    digitalWrite(stepPin,LOW); 
    delayMicroseconds(100); 
   }
  //delay(1000); 
  }

  // Enables the motor to move in the opposite direction
  else 
   {
    counter = ((angle/(degree_per_step/32))/2)*(-1);
    digitalWrite(dirPin,LOW); 
    for(int x = 0; x < counter; x++)
    {
    digitalWrite(stepPin,HIGH); 
    delayMicroseconds(100); 
    digitalWrite(stepPin,LOW); 
    delayMicroseconds(100); 
    }
  //delay(1000); 
  }
  
}
