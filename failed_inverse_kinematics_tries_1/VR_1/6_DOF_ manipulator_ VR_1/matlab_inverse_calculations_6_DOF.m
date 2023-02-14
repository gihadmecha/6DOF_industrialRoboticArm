%need improve these inverse calculatons, there are many problems

 %the desired position
x = 40  %the distance between the base and the end_effector in the direction of x_0 in cm
y = 0   %the distance between the base and the end_effector in the direction of y_0 in cm
z = 40  %the distance between the base and the end_effector in the direction of z_0 in cm

 %the desired orientation
R0_6(1,1) = 1;   R0_6(1,2) = 0;   R0_6(1,3) = 0;
R0_6(2,1) = 0;   R0_6(2,2) =-1;   R0_6(2,3) = 0;  
R0_6(3,1) = 0;   R0_6(3,2) = 0;   R0_6(3,3) =-1;

R0_6                                              %print the desired orientation matrix

 %lengths of links in cm
l1 = 10 
l2 = 30
l3 = 40
l4 = 0
l5 = 0
l6 = 0
 
 %not sure
 %inverse kinematics equations from graphical solutions
r=sqrt(((z-l1)*(z-l1))+ x*x+ y*y)
ph1=acos((l3*l3-r*r-l2*l2)/(-2*r*l2))
ph2=acos((r*r-l2*l2-l3*l3)/(-2*l2*l3))
ph3=atan((z-l1)/(sqrt(x*x+y*y)))
ph4=(pi/2)-ph3
th1=atan(y/x)                         %theta_1 ,in radian, the first or second quadrature
th2=ph1-ph4                           %theta_2 in radian , the first or fourth quadrature 
th3=ph2-(pi/2)                        %theta_3 ,in radian, the first or second quadrature

 %another solution for th1, th2, th3
%note: assume the available motor movement range in my design:
%               0 < th1 < (2*pi)
%               (-pi/2) < th2 < (pi/2)
%               0 < th3 < pi

%th1 = th1 + pi        %th1 in the third quadrature if (+tan(th1))
                       %th1 in the fourth quadrature if (-tan(th1))
                       % ,where 0 < th1 < (2*pi)
%th2                   %no another solution for th2 because ,in the the first quadrature (+tan(ph3)) and in the fourth quadrature (-tan(ph3)), cos(ph1) is the same in two cases 
                       % ,where (-pi/2) < th2 < (pi/2)
%th3                   %no another solution for th3 because ,in the the first quadrature (+cos(ph2)) and in the second quadrature (-cos(ph2)) 
                       % ,where 0 < th3 < pi

 %Hemogenious transforamation matrices among manipulatior frames solved
 %using DH_parameter table for the manipulator
R0_1 = [cos(th1)      0      sin(th1);
        sin(th1)      0     -cos(th1);
           0          1         0    ] 
       
R1_2 = [cos(th2)  -sin(th2)     0    ;
        sin(th2)   cos(th2)     0    ;
           0          0         1    ]
       
R2_3 = [cos(th3)      0     sin(th3) ;
        sin(th3)      0    -cos(th3) ;
          0           1         0    ]


 %steps to get R3_6 matrix
R0_2 = R0_1 *R1_2                         %get R0_2 marix
R0_3 = R0_1 * R1_2 * R2_3                 %get R0_3 matrix
R0_3_inverse = inv(R0_3)                  %get R0_3_inverse matrix 
R3_6 = R0_3_inverse * R0_6                %get R3_6 matrix 


 %get spherical wrist joint thetas ,responding to the desired end_effector orientation, from R3_6 matrix
%note: th4, th6 get "Error Solution" at th5 = 0 becauce sin(th5)= 0 and I can't divide by "zero" 
%      and I must find way to solve this problem "I can't show them as zeroes"
th5 = acos(R3_6(3,3));                    %theta_5 in radian
th4 = acos((-R3_6(1,3))/sin(th5));        %theta_4 in radian
th6 = acos(R3_6(3,1)/sin(th5));           %theta_6 in radian


 %get R3_6_check matrix
 %note: it's a check matrix, use other solutions for th1, th2, th3 up in comments if R3_6 != R3_6_check  

R3_4 = [cos(th4)      0    -sin(th4) ;
        sin(th4)      0     cos(th4) ;
          0          -1         0    ]

R4_5 = [ cos(th5)     0    -sin(th5) ;
        -sin(th5)     0    -cos(th5) ;
          0           1         0    ]

R5_6 = [cos(th6)  -sin(th6)     0    ;
        sin(th6)   cos(th6)     0    ;
           0          0         1    ]
       
R3_6_check_1 = R3_4*R4_5*R5_6 
R3_6_check_2 = [cos(th4)*cos(th5)*cos(th6)-sin(th4)*sin(th6)    -cos(th4)*cos(th5)*sin(th6)-sin(th4)*cos(th6)       -cos(th4)*sin(th5) ;
                sin(th4)*cos(th5)*cos(th6)+cos(th4)*sin(th6)    -sin(th4)*cos(th5)*sin(th6)+cos(th4)*cos(th6)       -sin(th4)*sin(th5) ;
                sin(th5)*cos(th6)                               -sin(th5)*sin(th6)                                   cos(th5)          ]

 %results in degrees
th1=(th1*180.0)/pi                       %theta_1 in degrees
th2=(th2*180.0)/pi                       %theta_2 in degrees
th3=(th3*180.0)/pi                       %theta_3 in degrees
th4=(th4*180.0)/pi                       %theta_4 in degrees
th5=(th5*180.0)/pi                       %theta_5 in degrees
th6=(th6*180.0)/pi                       %theta_6 in degrees
