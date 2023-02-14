% need to improve that inverse simulations

 %peter corke Robotics toolbox path
addpath C:\robot-10.2\rvctools
startup_rvc

 %given thetas
th1 = pi/4
th2 = pi/4
th3 = pi/4

 %lengths of links in cm
l1 = 10 
l2 = 30 
l3 = 40
 
 %build 3_DOF manipulatior using DH_parameter table and object oriented
L1 = Link('d', l1, 'a', 0, 'alpha', pi/2)
L2 = Link('d', 0 , 'a', l2, 'alpha', 0, 'offset', pi/2)
L3 = Link('d', 0, 'a', l3, 'alpha', 0,'offset',-pi/2)%note: it's not the same L3 in the forward & inverse 6_DOF files
bot = SerialLink([L1 L2 L3], 'name', 'my robot')                           

 %forward kinematics simulations
T = bot.fkine([th1 th2 th3])            %forward kinematics function from the Robotics toolbox get the desired positon
bot.plot([th1 th2 th3])                  %plot function