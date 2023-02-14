% U(1) == X
% U(2) == Y
% U(3) == Z
% U(4) == alpha
% U(5) == beta
% U(6) == gamma
% 
% y(1) = th(1)
% y(2) = th(2)
% y(3) = th(3)
% y(4) = th(4)
% y(5) = th(5)
% y(6) = th(6)

function [theta_steps, velocity_steps, acceleration_steps]= inverse_kinematics_v2(u)

%  lengths of links in mm
l1 = 215.5;   %35; 
l2 = 19.58;   %20.46; 
l3 = 173;
l4 = 195;
l5 = 182;
l6 = 120.27;
l7 = 62;
l8 = 61;

M1_FAC= 11.1;% (1/5 microstep).> 1000step/rev  && 4gear ratio so (1000/360)*4=11.1
M2_FAC= 25;  % (1/5 microstep).> 1000step/rev  && 9gear ratio so (1000/360)*9=25
M3_FAC= 25;  % (1/5 microstep).> 1000step/rev  && 9gear ratio so (1000/360)*9=25
M4_FAC= 6.67;% (1/4 microstep).> 800step/rev   && 3gear ratio so (800 /360)*3=6.667
M5_FAC= 6.67;% (1/4 microstep).> 800step/rev   && 3gear ratio so (800 /360)*3=6.667
M6_FAC= 6.67;% (1/4 microstep).> 800step/rev   && 3gear ratio so (800 /360)*3=6.667

% time for point to point joint_trajectory in seconds
T = 5;

% angles to orientation (Euler)
Rx = rotx(u(4)*2*pi/360);
Ry = roty(u(5)*2*pi/360);
Rz = rotz(u(6)*2*pi/360);
Rxyz = Rx*Ry*Rz;

% SOLVE
lb = [-pi ,(-108*(pi/180)) ,(-15*(pi/180)) ,-pi , (-19*(pi/180) )  ,-pi  ];
ub = [+pi ,(45*(pi/180))   ,(194*(pi/180) ),pi  , (148*(pi/180))   ,pi  ];
th0 = [0,0,0,0,0,0];
F = lsqnonlin(@functions,th0,lb,ub);

% calculations
function F = functions(th)
F = [ 
 cos(th(6))*(cos(th(5) + pi/2)*(sin(th(1))*sin(th(4)) - cos(th(4))*(cos(th(1))*sin(th(3))*sin(th(2) + pi/2) - cos(th(1))*cos(th(3))*cos(th(2) + pi/2))) - sin(th(5) + pi/2)*(cos(th(1))*cos(th(3))*sin(th(2) + pi/2) + cos(th(1))*cos(th(2) + pi/2)*sin(th(3)))) - sin(th(6))*(cos(th(4))*sin(th(1)) + sin(th(4))*(cos(th(1))*sin(th(3))*sin(th(2) + pi/2) - cos(th(1))*cos(th(3))*cos(th(2) + pi/2)))-Rxyz(1,1);
-cos(th(6))*(cos(th(4))*sin(th(1)) + sin(th(4))*(cos(th(1))*sin(th(3))*sin(th(2) + pi/2) - cos(th(1))*cos(th(3))*cos(th(2) + pi/2))) - sin(th(6))*(cos(th(5) + pi/2)*(sin(th(1))*sin(th(4)) - cos(th(4))*(cos(th(1))*sin(th(3))*sin(th(2) + pi/2) - cos(th(1))*cos(th(3))*cos(th(2) + pi/2))) - sin(th(5) + pi/2)*(cos(th(1))*cos(th(3))*sin(th(2) + pi/2) + cos(th(1))*cos(th(2) + pi/2)*sin(th(3))))-Rxyz(1,2);
-sin(th(5) + pi/2)*(sin(th(1))*sin(th(4)) - cos(th(4))*(cos(th(1))*sin(th(3))*sin(th(2) + pi/2) - cos(th(1))*cos(th(3))*cos(th(2) + pi/2))) - cos(th(5) + pi/2)*(cos(th(1))*cos(th(3))*sin(th(2) + pi/2) + cos(th(1))*cos(th(2) + pi/2)*sin(th(3)))-Rxyz(1,3);
(l5 + l6)*(cos(th(1))*cos(th(3))*sin(th(2) + pi/2) + cos(th(1))*cos(th(2) + pi/2)*sin(th(3))) - (l7 + l8)*(sin(th(5) + pi/2)*(sin(th(1))*sin(th(4)) - cos(th(4))*(cos(th(1))*sin(th(3))*sin(th(2) + pi/2) - cos(th(1))*cos(th(3))*cos(th(2) + pi/2))) + cos(th(5) + pi/2)*(cos(th(1))*cos(th(3))*sin(th(2) + pi/2) + cos(th(1))*cos(th(2) + pi/2)*sin(th(3)))) + l2*cos(th(1)) + l4*cos(th(1))*cos(th(2) + pi/2)-u(1);
sin(th(6))*(cos(th(1))*cos(th(4)) + sin(th(4))*(cos(th(3))*cos(th(2) + pi/2)*sin(th(1)) - sin(th(1))*sin(th(3))*sin(th(2) + pi/2))) - cos(th(6))*(cos(th(5) + pi/2)*(cos(th(1))*sin(th(4)) - cos(th(4))*(cos(th(3))*cos(th(2) + pi/2)*sin(th(1)) - sin(th(1))*sin(th(3))*sin(th(2) + pi/2))) + sin(th(5) + pi/2)*(cos(th(3))*sin(th(1))*sin(th(2) + pi/2) + cos(th(2) + pi/2)*sin(th(1))*sin(th(3))))-Rxyz(2,1);
sin(th(6))*(cos(th(5) + pi/2)*(cos(th(1))*sin(th(4)) - cos(th(4))*(cos(th(3))*cos(th(2) + pi/2)*sin(th(1)) - sin(th(1))*sin(th(3))*sin(th(2) + pi/2))) + sin(th(5) + pi/2)*(cos(th(3))*sin(th(1))*sin(th(2) + pi/2) + cos(th(2) + pi/2)*sin(th(1))*sin(th(3)))) + cos(th(6))*(cos(th(1))*cos(th(4)) + sin(th(4))*(cos(th(3))*cos(th(2) + pi/2)*sin(th(1)) - sin(th(1))*sin(th(3))*sin(th(2) + pi/2)))-Rxyz(2,2);
sin(th(5) + pi/2)*(cos(th(1))*sin(th(4)) - cos(th(4))*(cos(th(3))*cos(th(2) + pi/2)*sin(th(1)) - sin(th(1))*sin(th(3))*sin(th(2) + pi/2))) - cos(th(5) + pi/2)*(cos(th(3))*sin(th(1))*sin(th(2) + pi/2) + cos(th(2) + pi/2)*sin(th(1))*sin(th(3)))-Rxyz(2,3);
(l5 + l6)*(cos(th(3))*sin(th(1))*sin(th(2) + pi/2) + cos(th(2) + pi/2)*sin(th(1))*sin(th(3))) + (l7 + l8)*(sin(th(5) + pi/2)*(cos(th(1))*sin(th(4)) - cos(th(4))*(cos(th(3))*cos(th(2) + pi/2)*sin(th(1)) - sin(th(1))*sin(th(3))*sin(th(2) + pi/2))) - cos(th(5) + pi/2)*(cos(th(3))*sin(th(1))*sin(th(2) + pi/2) + cos(th(2) + pi/2)*sin(th(1))*sin(th(3)))) + l2*sin(th(1)) + l4*cos(th(2) + pi/2)*sin(th(1))-u(2);
cos(th(6))*(sin(th(5) + pi/2)*(cos(th(3))*cos(th(2) + pi/2) - sin(th(3))*sin(th(2) + pi/2)) + cos(th(4))*cos(th(5) + pi/2)*(cos(th(3))*sin(th(2) + pi/2) + cos(th(2) + pi/2)*sin(th(3)))) + sin(th(4))*sin(th(6))*(cos(th(3))*sin(th(2) + pi/2) + cos(th(2) + pi/2)*sin(th(3)))-Rxyz(3,1);
cos(th(6))*sin(th(4))*(cos(th(3))*sin(th(2) + pi/2) + cos(th(2) + pi/2)*sin(th(3))) - sin(th(6))*(sin(th(5) + pi/2)*(cos(th(3))*cos(th(2) + pi/2) - sin(th(3))*sin(th(2) + pi/2)) + cos(th(4))*cos(th(5) + pi/2)*(cos(th(3))*sin(th(2) + pi/2) + cos(th(2) + pi/2)*sin(th(3))))-Rxyz(3,2);
cos(th(5) + pi/2)*(cos(th(3))*cos(th(2) + pi/2) - sin(th(3))*sin(th(2) + pi/2)) - cos(th(4))*sin(th(5) + pi/2)*(cos(th(3))*sin(th(2) + pi/2) + cos(th(2) + pi/2)*sin(th(3)))-Rxyz(3,3);
l1 + l3 - (l5 + l6)*(cos(th(3))*cos(th(2) + pi/2) - sin(th(3))*sin(th(2) + pi/2)) + l4*sin(th(2) + pi/2) + (l7 + l8)*(cos(th(5) + pi/2)*(cos(th(3))*cos(th(2) + pi/2) - sin(th(3))*sin(th(2) + pi/2)) - cos(th(4))*sin(th(5) + pi/2)*(cos(th(3))*sin(th(2) + pi/2) + cos(th(2) + pi/2)*sin(th(3))))-u(3);

    ];
end


%initial pose in steps
% th1_i = 0;
% th2_i = 0;
% th3_i = 0;
% th4_i = 0;
% th5_i = 0;
% th6_i = 0;
global curr_th;
qi=curr_th

% %final pose in steps
% degree_per_step_1 = 1.8;
% degree_per_step_2 = 1.8;
% degree_per_step_3 = 1.8;
% degree_per_step_4 = 1.8;
% degree_per_step_5 = 1.8;
% degree_per_step_6 = 1.8;
% th1_f = F(1)*(180/pi)*(32/degree_per_step_1);
% th2_f = F(2)*(180/pi)*(32/degree_per_step_2);
% th3_f = F(3)*(180/pi)*(32/degree_per_step_3);
% th4_f = F(4)*(180/pi)*(32/degree_per_step_4);
% th5_f = F(5)*(180/pi)*(32/degree_per_step_5);
% th6_f = F(6)*(180/pi)*(32/degree_per_step_6);

th1_f = F(1)*(180/pi)*M1_FAC;
th2_f = F(2)*(180/pi)*M2_FAC;
th3_f = F(3)*(180/pi)*M3_FAC;
th4_f = F(4)*(180/pi)*M4_FAC;
th5_f = F(5)*(180/pi)*M5_FAC;
th6_f  =F(6)*(180/pi)*M6_FAC;

%point to point joint_trajectory through 0:1 second 
qi = ([th1_i th2_i th3_i th4_i th5_i th6_i]);           
qf = ([th1_f th2_f th3_f th4_f th5_f th6_f]);


t = [0: .05: T]';
length (t);

[theta_steps, velocity_steps, acceleration_steps]= jtraj(qi, qf, length(t));

%point to point joint_trajectory through 0:T second 
velocity_steps = velocity_steps * (1/T);
acceleration_steps = acceleration_steps * (1/T);

% velocity_steps;
% acceleration_steps;
end