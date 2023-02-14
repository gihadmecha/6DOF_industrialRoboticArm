clear
clc

% peter corke Robotics toolbox path
addpath C:\robot-10.2\rvctools
startup_rvc

 %given thetas in degrees
th1 = 0 ; 
th2 = 0 ;
th3 = 0 ;
th4 = 0 ;
th5 = 0 ;
th6 = 0 ;
 %given thetas in radians
th1 = th1 * (pi/180);
th2 = th2 * (pi/180);
th3 = th3 * (pi/180);
th4 = th4 * (pi/180);
th5 = th5 * (pi/180);
th6 = th6 * (pi/180);

 %lengths of links in mm
l1 = 215.5;    
l2 = 19.58;   
l3 = 173;
l4 = 195;
l5 = 182;
l6 = 120.27;
l7 = 62;
l8 = 61;   %edit after the gripper

 %build 6_DOF manipulatior using DH_parameter table and object oriented
L1 = Link('d', l1+l3, 'a', l2, 'alpha', pi/2);
L2 = Link('d', 0 , 'a', l4, 'alpha', 0, 'offset', pi/2);
L3 = Link('d', 0, 'a', 0, 'alpha', -pi/2, 'offset', pi);
L4 = Link('d', l5+l6, 'a', 0, 'alpha', -pi/2, 'offset', pi);
L5 = Link('d', 0, 'a', 0, 'alpha', -pi/2, 'offset', pi/2);
L6 = Link('d', l7+l8, 'a', 0, 'alpha', 0);
HTI_Robot = SerialLink([L1 L2 L3 L4 L5 L6], 'name', 'HTI_Robot')

  
 %forward kinematics simulations
the_orientation = HTI_Robot.fkine([th1 th2 th3 th4 th5 th6])%forward kinematics function from the Robotics toolbox get the desired positon & orientation
HTI_Robot.plot([th1 th2 th3 th4 th5 th6])                   %plot function


