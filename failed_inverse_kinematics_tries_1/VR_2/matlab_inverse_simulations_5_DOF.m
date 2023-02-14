clear
clc
% need to improve these inverse simulations
 
 %peter corke Robotics toolbox path
addpath C:\robot-10.2\rvctools
startup_rvc

 %the desired position & orientation 
T(1,1) = 0 ;   T(1,2) = 0;   T(1,3) = 1 ;  T(1,4) = 60;   
T(2,1) = 0;    T(2,2) =-1;   T(2,3) = 0;   T(2,4) =  0;   
T(3,1) = 1;    T(3,2) = 0;   T(3,3) = 0;   T(3,4) = 10;
T(4,1) = 0;    T(4,2) = 0;   T(4,3) = 0;   T(4,4) = 1 ;

T                                                   %print the desired hemogenious transformation matrix

 %lengths of links in cm
l1 = 10 
l2 = 30 
l3 = 30
l4 = 0
l5 = 0

 %build 5_DOF manipulatior using DH_parameter table and object oriented
L1 = Link('d', l1, 'a', 0, 'alpha', pi/2)
L2 = Link('d', 0 , 'a', l2, 'alpha', 0)
L3 = Link('d', 0, 'a', l3, 'alpha', 0)
L4 = Link('d', 0, 'a', 0, 'alpha', pi/2, 'offset', pi/2)
L5 = Link('d', l4+l5, 'a', 0, 'alpha', 0)
bot = SerialLink([L1 L2 L3 L4 L5], 'name', 'my robot')

 %inverse kinematics simulations
qi = bot.ikine(T,[0 0 0 0 0],'mask',[1 1 1 1 1 0])                                     %inverse kinematics function from the Robotics toolbox get the desired joint angles
bot.plot(qi)                                         %plot function