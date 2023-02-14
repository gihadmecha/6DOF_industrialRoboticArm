clear
clc

%peter corke Robotics toolbox path
% addpath C:\robot-10.2\rvctools
% startup_rvc

 %given thetas_i
th1_i = 0
th2_i = 0
th3_i = 0
th4_i = 0
th5_i = 0
th6_i = 0
degree_per_step = 1.8
%given thetas_f
th1_f = pi/4*(180/pi)*(32/degree_per_step)
th2_f = pi/4*(180/pi)*(32/degree_per_step)
th3_f = pi/4*(180/pi)*(32/degree_per_step)
th4_f = pi/4*(180/pi)*(32/degree_per_step)
th5_f = pi/4*(180/pi)*(32/degree_per_step)
th6_f = pi/4*(180/pi)*(32/degree_per_step)

 %lengths of links in cm
l1 = 10 
l2 = 30 
l3 = 40
l4 = 0
l5 = 0
l6 = 0

 %build 3_DOF manipulatior using DH_parameter table and object oriented
L1 = Link('d', l1, 'a', 0, 'alpha', pi/2)
L2 = Link('d', 0 , 'a', l2, 'alpha', 0, 'offset', pi/2)
L3 = Link('d', 0, 'a', 0, 'alpha', pi/2)
L4 = Link('d', l3+l4, 'a', 0, 'alpha', -pi/2)
L5 = Link('d', 0, 'a', 0, 'alpha', pi/2, 'offset', -pi/2)
L6 = Link('d', l5+l6, 'a', 0, 'alpha', 0)
bot = SerialLink([L1 L2 L3 L4 L5 L6], 'name', 'my robot')

  
 
qi = ([th1_i th2_i th3_i th4_i th5_i th6_i])            
qf = ([th1_f th2_f th3_f th4_f th5_f th6_f])

% Ti = bot.fkine(qi)
% Tf = bot.fkine(qf)



t = [0: .05: 5]'
length (t)

% q = jtraj(qi, qf, length(t))
% [q qd qdd]= jtraj(qi, qf, length(t))
% or
[q qd qdd]= jtraj(qi, qf, t)
qd = qd * (1/5)
qdd = qdd * (1/5)
% 
% bot.plot(qi)
% bot.plot(qf)
% bot.plot(q)
% 
% plot(q)
% pause
% qplot(q)
% pause
% qplot(qd)
% pause
% qplot(qdd)
% pause
% 
% plot(t, q)
% pause
% plot(t, qd)
% pause
% plot(t, qdd)
% pause
% 
% plot(t, q(:,1))
% pause
% plot(t, q(:,1), t, qd(:,1), t, qdd(:,1))
% grid
% pause
% 
% T = bot.fkine(q)
% p = transl(T)
% plot(p(:,1),p(:,2))
% pause
% plot(p)
% grid