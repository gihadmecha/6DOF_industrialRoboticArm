//need improve these inverse calculations, there are many problems

#include <iostream>
#include <math.h>

using namespace std;

float pi = 3.1416 ;

 //the desired position & orientation
float x = 0.0 ;  //declare the distance between the base and the end_effector in the direction of x_0 in cm
float y = 0.0 ;  //declare the distance between the base and the end_effector in the direction of y_0 in cm
float z = 0.0 ;  //declare the distance between the base and the end_effector in the direction of z_0 in cm
float R0_5[3][3]; //declare the desired orientation matrix

//lengths of links in cm
float l1 = 10.0 ;
float l2 = 30.0 ;
float l3 = 30.0 ;
float l4 = 0.0 ;
float l5 = 0.0 ;

int main ()
{
    while(1)
    {  //Enter the desired position
       cout << "Enter desired X position : "<<endl;
       cin  >> x ;
       cout << "Enter desired Y position : "<<endl;
       cin  >> y ;
       cout << "Enter desired Z position : "<<endl;
       cin  >> z ;
       //print the desired position
       cout << "end effector displacement in X direction: "<<x<<endl;
       cout << "end effector displacement in Y direction: "<<y<<endl;
       cout << "end effector displacement in Z direction: "<<z<<endl;
       cout << endl;

       //Enter the desired orientation
       cout<<endl;
       cout << "Enter desired orientation row after row : "<<endl;
       for(int i=0;i<3;i++)
        {
         for(int j=0;j<3;j++)
         {
            cin>>R0_5[i][j];
         }
        }
       //print the desired orientation
       cout << "desired end effector orientation is :  "<<endl;
       cout<<endl;
       for(int i=0;i<3;i++)
        {
         for(int j=0;j<3;j++)
         {
            cout<<'\t'<<'\t'<<R0_5[i][j];
         }
         cout<<endl;
        }
       cout<<endl;

        // not sure
        //inverse kinematics equations from graphical solutions
       float r=sqrt(((z-l1)*(z-l1))+ x*x+ y*y);
       float ph1=acos((l3*l3-r*r-l2*l2)/(-2*r*l2));
       float ph2=acos((r*r-l2*l2-l3*l3)/(-2*l2*l3));
       float ph3=atan((z-l1)/(sqrt(x*x+y*y)));
       float th1=atan(y/x);                         //theta_1 in radianæ the first or second quadrature
       float th2=ph3-ph1;                           //theta_2 in radianæ the first or fourth quadrature
       float th3=pi-ph2;                            //theta_3 in radianæ the first or second quadrature

       //another solution for th1, th2, th3
       //note: assume the available motor movement range in my design:
       //               0 < th1 < (2*pi)
       //               (-pi/2) < th2 < (pi/2)
       //               0 < th3 < pi

       //th1 = th1 + pi        //th1 in the third quadrature if (+tan(th1))
                       //th1 in the fourth quadrature if (-tan(th1))
                       // ,where 0 < th1 < (2*pi)
       //th2                   //no another solution for th2 because ,in the the first quadrature (+tan(ph3)) and in the fourth quadrature (-tan(ph3)), cos(ph1) is the same in two cases
                       // ,where (-pi/2) < th2 < (pi/2)
       //th3                   //no another solution for th3 because ,in the the first quadrature (+cos(ph2)) and in the second quadrature (-cos(ph2))
                       // ,where 0 < th3 < pi

       //print theta1, 2, 3 in radian
      cout<<endl;
      cout << "theta_1 =  " <<th1<<endl;
      cout << "theta_2 =  " <<th2<<endl;
      cout << "theta_3 =  " <<th3<<endl;

       //Hemogenious transforamation matrices among manipulatior frames solved
       //using DH_parameter table for the manipulator
       float R0_1[3][3] = { {cos(th1),     0,      sin(th1)} ,
                            {sin(th1),     0,     -cos(th1)} ,
                            {0       ,     1,         0    } };
       float R1_2[3][3] = { {cos(th2), -sin(th2),     0    },
                            {sin(th2), cos(th2),      0    },
                            {0       ,    0     ,     1    } };
       float R2_3[3][3] = { {cos(th3), -sin(th3),     0    },
                            {sin(th3), cos(th3),      0    },
                            {0       ,    0     ,     1    } };


        //steps to get R3_6 matrix

        //print R0_1 matrix
        cout<<endl;
       cout <<"R0_1 =  "<<endl;
       cout<<endl;
       for(int i=0;i<3;i++)
        {
        for(int j=0;j<3;j++)
         {
            cout<<'\t'<<'\t'<<R0_1[i][j];
         }
        cout<<endl;
        }
       cout<<endl;
       //print R1_2 matrix
       cout<<endl;
       cout <<"R1_2 =  "<<endl;
       cout<<endl;
       for(int i=0;i<3;i++)
        {
        for(int j=0;j<3;j++)
         {
            cout<<'\t'<<'\t'<<R1_2[i][j];
         }
        cout<<endl;
        }
       cout<<endl;
       //print R2_3 matrix
       cout<<endl;
       cout <<"R2_3 =  "<<endl;
       cout<<endl;
       for(int i=0;i<3;i++)
        {
        for(int j=0;j<3;j++)
         {
            cout<<'\t'<<'\t'<<R2_3[i][j];
         }
        cout<<endl;
        }
       cout<<endl;

       //get R0_2 matrix
      float R0_2[3][3];
      for(int i = 0; i < 3; ++i)
        for(int j = 0; j < 3; ++j)
         {
            R0_2[i][j] = 0.0 ;
            for(int n = 0; n < 3; ++n)
             {
                R0_2[i][j] = R0_2[i][j] + R0_1[i][n] * R1_2[n][j];
             }
         }
         //print R0_2
      cout<<endl;
      cout<<"R0_2: "<<endl;
      for(int i=0;i<3;i++)
       {
         for(int j=0;j<3;j++)
          {
            cout<<'\t'<<R0_2[i][j];
          }
        cout<<endl;
       }
      cout<<endl;

       //get R0_3 matrix
      float R0_3[3][3];
      for(int i = 0; i < 3; ++i)
        for(int j = 0; j < 3; ++j)
         {
            R0_3[i][j] = 0.0 ;
            for(int n = 0; n < 3; ++n)
             {
                R0_3[i][j] = R0_3[i][j] + R0_2[i][n] * R2_3[n][j];
             }
         }
         //print R0_3
      cout<<endl;
      cout<<"R0_3: "<<endl;
      for(int i=0;i<3;i++)
       {
         for(int j=0;j<3;j++)
          {
            cout<<'\t'<<'\t'<<R0_3[i][j];
          }
        cout<<endl;
       }
      cout<<endl;

      //get determinant
      cout<<endl;
      float determinant = 0.0;
      for(int i = 0; i < 3; i++)
          determinant = determinant + (R0_3[0][i] * (R0_3[1][(i+1)%3] * R0_3[2][(i+2)%3] - R0_3[1][(i+2)%3] * R0_3[2][(i+1)%3]));

      cout<<"\n\ndeterminant: "<<determinant;
      cout<<endl;

      //get R0_3 inverse
      cout<<endl;
      cout<<"\n\nInverse of matrix is: \n";
      cout<<endl;
      for(int i = 0; i < 3; i++)
        {
        for(int j = 0; j < 3; j++)
            cout<<((R0_3[(j+1)%3][(i+1)%3] * R0_3[(j+2)%3][(i+2)%3]) - (R0_3[(j+1)%3][(i+2)%3] * R0_3[(j+2)%3][(i+1)%3]))/ determinant<<"\t"<<'\t';

        cout<<"\n";
        }
      cout<<endl;

      //get R3_5 matrix
      float R3_5[3][3];
      for(int i = 0; i < 3; ++i)
        for(int j = 0; j < 3; ++j)
         {
            R3_5[i][j] = 0.0 ;
            for(int n = 0; n < 3; ++n)
             {
                R3_5[i][j] = R3_5[i][j] + R0_3[i][n] * R0_5[n][j];
             }
         }
         //print R3_5
      cout<<endl;
      cout<<"R3_5: "<<endl;
      for(int i=0;i<3;i++)
       {
         for(int j=0;j<3;j++)
          {
            cout<<'\t'<<'\t'<<R3_5[i][j];
          }
        cout<<endl;
       }
      cout<<endl;

       //get thetas
       //get spherical wrist joint thetas ,responding to the desired end_effector orientation, from R3_6 matrix
       //note: th4, th6 get "Error Solution" at th5 = 0 becauce sin(th5)= 0 and I can't divide by "zero"
       //      and I must find way to solve this problem "I can't show them as zeroes"
     float th5 = acos(R3_5[2][1]);
     float th4 = asin(R3_5[0][2]);

      //print theta in radian
      cout<<endl;
      cout << "theta_1 =  " <<th1<<endl;
      cout << "theta_2 =  " <<th2<<endl;
      cout << "theta_3 =  " <<th3<<endl;
      cout << "theta_4 =  " <<th4<<endl;
      cout << "theta_5 =  " <<th5<<endl;
      cout << endl;

      //get R3_5_check matrix
      //note: it's a check matrix, use other solutions for th1, th2, th3 up in comments if R3_5 != R3_5_check
      float R3_5_check_2[3][3] = {{cos(th4)*cos(th5),   cos(th4)*(-sin(th5)),    sin(th4)},
                                  {sin(th4)*cos(th5),   sin(th4)*(-sin(th5)),   -cos(th4)},
                                  {     sin(th5)    ,         cos(th5)      ,      0     }};


      //print R3_5_check
      cout<<endl;
      cout<<"R3_5_check: "<<endl;
      for(int i=0;i<3;i++)
       {
         for(int j=0;j<3;j++)
          {
            cout<<'\t'<<'\t'<<R3_5_check_2[i][j];
          }
        cout<<endl;
       }
      cout<<endl;

       //thetas in degrees
       cout<<endl;
       th1=(th1*180.0)/pi;                    //theta_1 in degrees
       th2=(th2*180.0)/pi;                    //theta_2 in degrees
       th3=(th3*180.0)/pi;                   //theta_3 in degrees
       th4=(th4*180.0)/pi;                    //theta_4 in degrees
       th5=(th5*180.0)/pi;                    //theta_5 in degrees

      //print thetas in degree
      cout<<endl;
      cout << "theta_1 =  " <<th1<<endl;
      cout << "theta_2 =  " <<th2<<endl;
      cout << "theta_3 =  " <<th3<<endl;
      cout << "theta_4 =  " <<th4<<endl;
      cout << "theta_5 =  " <<th5<<endl;
      cout << endl;

    }
}

