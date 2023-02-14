#include <iostream>
#include <math.h>

using namespace std;
 //the desired position
float x = 0.0 ;  //the distance between the base and the end_effector in the direction of x_0 in cm
float y = 0.0 ;  //the distance between the base and the end_effector in the direction of y_0 in cm
float z = 0.0 ;  //the distance between the base and the end_effector in the direction of z_0 in cm

float l1 = 10.0 ;
float l2 = 30.0 ;
float l3 = 40.0 ;

float pi = 3.1416 ;

int main ()
{
    while(1)
    {
       cout << "Enter desired X position : "<<endl;
       cin  >> x ;
       cout << "Enter desired Y position : "<<endl;
       cin  >> y ;
       cout << "Enter desired Z position : "<<endl;
       cin  >> z ;

       cout << "end effector displacement in X direction: "<<x<<endl;
       cout << "end effector displacement in Y direction: "<<y<<endl;
       cout << "end effector displacement in Z direction: "<<z<<endl;
       cout << endl;

        // not sure
        //inverse kinematics equations from graphical solutions
       float r=sqrt(((z-l1)*(z-l1))+ x*x+ y*y);
       float ph1=acos((l3*l3-r*r-l2*l2)/(-2*r*l2));
       float ph2=acos((r*r-l2*l2-l3*l3)/(-2*l2*l3));
       float ph3=atan((z-l1)/(sqrt(x*x+y*y)));
       float ph4=(pi/2)-ph3;
       float th1=atan(y/x);                         //theta_1 in radian
       float th2=ph1-ph4;                           //theta_2 in radian
       float th3=ph2-(pi/2);

        //results in degrees
       th1=(th1*180.0)/pi;                    //theta_1 in degrees
       th2=(th2*180.0)/pi;                    //theta_2 in degrees
       th3=(th3*180.0)/pi;                   //theta_3 in degrees

      cout << "theta_1 =  " <<th1<<endl;
      cout << "theta_2 =  " <<th2<<endl;
      cout << "theta_3 =  " <<th3<<endl;
      cout << endl;

    }
}
