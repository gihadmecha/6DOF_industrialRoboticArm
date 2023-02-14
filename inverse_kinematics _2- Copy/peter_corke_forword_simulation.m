clear
clc

%peter corke Robotics toolbox path
addpath C:\robot-10.2\rvctools
startup_rvc

 %given thetas
th1 = 0
th2 = 2.014
th3 = 0
th4 = 0
th5 = -3.585
th6 = 0

 %lengths of links in mm
l1 = 35 
l2 = 10 
l3 = 130
l4 = 190
l5 = 183
l6 = 117.47
l7 = 63
l8 = 68

 %build 6_DOF manipulatior using DH_parameter table and object oriented
L1 = Link('d', l1+l3, 'a', l2, 'alpha', pi/2)
L2 = Link('d', 0 , 'a', l4, 'alpha', 0)
L3 = Link('d', 0, 'a', 0, 'alpha', pi/2)
L4 = Link('d', l5+l6, 'a', 0, 'alpha', -pi/2)
L5 = Link('d', 0, 'a', 0, 'alpha', pi/2, 'offset', -pi/2)
L6 = Link('d', l7+l8, 'a', 0, 'alpha', 0)
bot = SerialLink([L1 L2 L3 L4 L5 L6], 'name', 'my robot')

  
 %forward kinematics simulations
T = bot.fkine([th1 th2 th3 th4 th5 th6])            %forward kinematics function from the Robotics toolbox get the desired positon & orientation
bot.plot([th1 th2 th3 th4 th5 th6])                  %plot function 
