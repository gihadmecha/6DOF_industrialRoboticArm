%peter corke Robotics toolbox path
addpath C:\robot-10.2\rvctools
startup_rvc

 %given thetas
th1 = 0
th2 = 0
th3 = 0
th4 = 0
th5 = 0

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

  
 %forward kinematics simulations
T = bot.fkine([th1 th2 th3 th4 th5])            %forward kinematics function from the Robotics toolbox get the desired positon & orientation
bot.plot([th1 th2 th3 th4 th5])                  %plot function 

