%need improve these inverse calculatons, there is problems

 %the desired position
x = 40  %the distance between the base and the end_effector in the direction of x_0 in cm
y = 0   %the distance between the base and the end_effector in the direction of y_0 in cm
z = 40  %the distance between the base and the end_effector in the direction of z_0 in cm

 %lengths of links in cm
l1 = 10 
l2 = 30
l3 = 40

 %not sure
 %inverse kinematics equations from graphical solutions
r=sqrt(((z-l1)*(z-l1))+ x*x+ y*y)
ph1=acos((l3*l3-r*r-l2*l2)/(-2*r*l2))
ph2=acos((r*r-l2*l2-l3*l3)/(-2*l2*l3))
ph3=atan((z-l1)/(sqrt(x*x+y*y)))
ph4=(pi/2)-ph3
th1=atan(y/x)                         %theta_1 in radian
th2=ph1-ph4                           %theta_2 in radian
th3=ph2-(pi/2)                        %theta_3 in radian
 
 %results in degrees
th1=(th1*180.0)/pi                    %theta_1 in degrees
th2=(th2*180.0)/pi                    %theta_2 in degrees
th3=(th3*180.0)/pi                    %theta_3 in degrees
 
 
 