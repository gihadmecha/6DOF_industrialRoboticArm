clear
clc
lb = [0,(-pi/4),(-pi/4),0,(-pi/4),0];
ub = [360,(5*pi/4),(5*pi/4),360,(5*pi/4),360];
th0 = [0,0,0,0,0,0];
th = lsqnonlin(@our_robot,th0,lb,ub);