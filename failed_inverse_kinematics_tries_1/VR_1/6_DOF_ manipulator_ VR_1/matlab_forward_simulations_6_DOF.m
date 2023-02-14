 %peter corke Robotics toolbox path
addpath C:\robot-10.2\rvctools
startup_rvc

 %given thetas
th1 = -27.2915
th2 = 1.0753
th3 = -3.2774
th4 = 6.2832
th5 = 10.3643
th6 = 35.5403

 %lengths of links in cm
l1 = 10 
l2 = 30 
l3 = 40
l4 = 0
l5 = 0
l6 = 0

 %build 6_DOF manipulatior using DH_parameter table and object oriented
L1 = Link('d', l1, 'a', 0, 'alpha', pi/2)
L2 = Link('d', 0 , 'a', l2, 'alpha', 0, 'offset', pi/2)
L3 = Link('d', 0, 'a', 0, 'alpha', pi/2)
L4 = Link('d', l3+l4, 'a', 0, 'alpha', -pi/2)
L5 = Link('d', 0, 'a', 0, 'alpha', pi/2, 'offset', -pi/2)
L6 = Link('d', l5+l6, 'a', 0, 'alpha', 0)
bot = SerialLink([L1 L2 L3 L4 L5 L6], 'name', 'my robot')

  
 %forward kinematics simulations
T = bot.fkine([th1 th2 th3 th4 th5 th6])            %forward kinematics function from the Robotics toolbox get the desired positon & orientation
bot.plot([th1 th2 th3 th4 th5 th6])                  %plot function 

