clear
clc

% %peter corke Robotics toolbox path
% addpath C:\robot-10.2\rvctools
% startup_rvc

 %given thetas
th1 = 0
th2 = -pi/2
th3 = -pi/2*-1
th4 = pi/3
th5 = 0
% th6 = pi/2

 %lengths of links in mm
l1 = 0 
l2 = 98.7 
l3 = 105
l4 = 126
l5 = 181
l6 = 0
% l7 = 63
% l8 = 68

 %build 6_DOF manipulatior using DH_parameter table and object oriented
% L1 = Link('d', l1, 'a', 0, 'alpha', 0)
L1 = Link('d', l2 , 'a', 0, 'alpha', -pi/2)
L2 = Link('d', 0, 'a', l3, 'alpha', 0)
L3 = Link('d', 0, 'a', l4, 'alpha', 0)
L4 = Link('d', 0, 'a', 0, 'alpha', -pi/2, 'offset', -pi/2 )
L5 = Link('d', l5+l6, 'a', 0, 'alpha', 0)
bot = SerialLink([L1 L2 L3 L4 L5], 'name', 'my robot')

  
 %forward kinematics simulations
T = bot.fkine([th1 th2 th3 th4 th5])            %forward kinematics function from the Robotics toolbox get the desired positon & orientation
% T(3,1)
bot.plot([th1 th2 th3 th4 th5])                  %plot function 

