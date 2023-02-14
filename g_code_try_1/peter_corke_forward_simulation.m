clear
clc

%peter corke Robotics toolbox path
addpath C:\robot-10.2\rvctools
startup_rvc

 %given thetas
th1 =  -0.00030661      
th2 =  -1.3819
th3 = -0.22025     
th4 = -0.016179
th5 = 1.6016
th6 = 0.015858

 %lengths of links in mm
l1 = 215.5;   %35; 
l2 = 19.58;   %20.46; 
l3 = 173;
l4 = 195;
l5 = 182;
l6 = 120.27;
l7 = 62;
l8 = 61;

 %build 6_DOF manipulatior using DH_parameter table and object oriented
L1 = Link('d', l1+l3, 'a', l2, 'alpha', pi/2)
L2 = Link('d', 0 , 'a', l4, 'alpha', 0, 'offset', pi/2)
L3 = Link('d', 0, 'a', 0, 'alpha', -pi/2, 'offset', pi)
L4 = Link('d', l5+l6, 'a', 0, 'alpha', -pi/2, 'offset', pi)
L5 = Link('d', 0, 'a', 0, 'alpha', -pi/2, 'offset', pi/2)
L6 = Link('d', l7+l8, 'a', 0, 'alpha', 0)
bot = SerialLink([L1 L2 L3 L4 L5 L6], 'name', 'my robot')

  
 %forward kinematics simulations
T = bot.fkine([th1 th2 th3 th4 th5 th6])            %forward kinematics function from the Robotics toolbox get the desired positon & orientation
bot.plot([th1 th2 th3 th4 th5 th6])                  %plot function 

