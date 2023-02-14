clear
clc

% need to improve that inverse simulations
 
 %peter corke Robotics toolbox path
addpath C:\robot-10.2\rvctools
startup_rvc

 %the desired position
%note: I use the identity matrix as an orientation because it's "don't care" for 3_DOF manipulators 
T(1,1) = 0;   T(1,2) = -0.7071 ;   T(1,3) = 0.7071 ;   T(1,4) = -15;   
T(2,1) = 0;   T(2,2) = -0.7071 ;   T(2,3) = -0.7071 ;   T(2,4) = -15 ;   
T(3,1) = 1;   T(3,2) = 0;   T(3,3) = 0;   T(3,4) = 71.21;
T(4,1) = 0;   T(4,2) = 0;   T(4,3) = 0;   T(4,4) =  1;

T                                                   %print the desired hemogenious transformation matrix 

%lengths of links in cm
l1 = 10 
l2 = 30 
l3 = 40
 
 %build 3_DOF manipulatior using DH_parameter table and object oriented
L1 = Link('d', l1, 'a', 0, 'alpha', pi/2)
L2 = Link('d', 0 , 'a', l2, 'alpha', 0, 'offset', pi/2)
L3 = Link('d', 0, 'a', l3, 'alpha', 0,'offset',-pi/2)%note: it's not the same L3 in the forward & inverse 6_DOF files
bot = SerialLink([L1 L2 L3], 'name', 'my robot') 

 %inverse kinematics simulations  
qi = bot.ikine(T,[0 0 0],'mask',[1 1 1 0 0 0])       %inverse kinematics function from the Robotics toolbox get the desired joint angles
bot.plot(qi)                                         %plot function