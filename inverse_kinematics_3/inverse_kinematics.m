% U(1) == X
% U(2) == Y
% U(3) == Z
% U(4) == alpha
% U(5) == beta
% U(6) == gamma
% 
% y(1) = th1
% y(2) = th2
% y(3) = th3
% y(4) = th4
% y(5) = th5
% y(6) = th6

function y = inverse_kinematics(u)

addpath C:\robot-10.2\rvctools

%  lengths of links in mm
l1 = 215.5;   %35; 
l2 = 19.58;   %20.46; 
l3 = 173;
l4 = 195;
l5 = 182;
l6 = 120.27;
l7 = 62;
l8 = 61;



% %the angles to orientation (Euler)
% Rx = rotx(u(4)*2*pi/360);
% Ry = roty(u(5)*2*pi/360);
% Rz = rotz(u(6)*2*pi/360);
% Rxyz = Rx*Ry*Rz;

alpha = u(4)*(pi/180);
beta =u(5)*(pi/180);
gamma = u(6)*(pi/180);

Rx = [1           0          0        ;
      0           cos(alpha) -sin(alpha);
      0           sin(alpha) cos(alpha)] ; 
  
Ry = [cos(beta)   0          sin(beta);
      0           1          0        ;
      -sin(beta)  0          cos(beta)];
  
Rz = [cos(gamma) -sin(gamma) 0;
      sin(gamma)  cos(gamma) 0;
      0           0          1];

Rxyz = Rz*Ry*Rx

% SOLVE
lb = [0,(-pi/4),(-pi/4),0,(-pi/4),0];
ub = [360,(5*pi/4),(5*pi/4),360,(5*pi/4),360];
th0 = [0,0,0,0,0,0];
F = lsqnonlin(@functions,th0,lb,ub);

% calculations
function F = functions(th)
F = [ - sin(th(6))*(cos(th(4))*sin(th(1)) + sin(th(4))*(cos(th(1))*cos(th(2))*sin(th(3)) + cos(th(1))*cos(th(3))*sin(th(2)))) - cos(th(6))*(sin(th(5))*(sin(th(1))*sin(th(4)) - cos(th(4))*(cos(th(1))*cos(th(2))*sin(th(3)) + cos(th(1))*cos(th(3))*sin(th(2)))) - cos(th(5))*(cos(th(1))*sin(th(2))*sin(th(3)) - cos(th(1))*cos(th(2))*cos(th(3)))) - H0_6(1,1);
 
sin(th(6))*(sin(th(5))*(sin(th(1))*sin(th(4)) - cos(th(4))*(cos(th(1))*cos(th(2))*sin(th(3)) + cos(th(1))*cos(th(3))*sin(th(2)))) - cos(th(5))*(cos(th(1))*sin(th(2))*sin(th(3)) - cos(th(1))*cos(th(2))*cos(th(3)))) - cos(th(6))*(cos(th(4))*sin(th(1)) + sin(th(4))*(cos(th(1))*cos(th(2))*sin(th(3)) + cos(th(1))*cos(th(3))*sin(th(2))))- H0_6(1,2);
 
- cos(th(5))*(sin(th(1))*sin(th(4)) - cos(th(4))*(cos(th(1))*cos(th(2))*sin(th(3)) + cos(th(1))*cos(th(3))*sin(th(2)))) - sin(th(5))*(cos(th(1))*sin(th(2))*sin(th(3)) - cos(th(1))*cos(th(2))*cos(th(3)))- H0_6(1,3);
 
l2*cos(th(1)) - (l7 + l8)*(cos(th(5))*(sin(th(1))*sin(th(4)) - cos(th(4))*(cos(th(1))*cos(th(2))*sin(th(3)) + cos(th(1))*cos(th(3))*sin(th(2)))) + sin(th(5))*(cos(th(1))*sin(th(2))*sin(th(3)) - cos(th(1))*cos(th(2))*cos(th(3)))) - (l5 + l6)*(cos(th(1))*sin(th(2))*sin(th(3)) - cos(th(1))*cos(th(2))*cos(th(3))) - l4*cos(th(1))*sin(th(2))- H0_6(1,4);
 
sin(th(6))*(cos(th(1))*cos(th(4)) - sin(th(4))*(cos(th(2))*sin(th(1))*sin(th(3)) + cos(th(3))*sin(th(1))*sin(th(2)))) + cos(th(6))*(sin(th(5))*(cos(th(1))*sin(th(4)) + cos(th(4))*(cos(th(2))*sin(th(1))*sin(th(3)) + cos(th(3))*sin(th(1))*sin(th(2)))) + cos(th(5))*(sin(th(1))*sin(th(2))*sin(th(3)) - cos(th(2))*cos(th(3))*sin(th(1))))- H0_6(2,1);
 
cos(th(6))*(cos(th(1))*cos(th(4)) - sin(th(4))*(cos(th(2))*sin(th(1))*sin(th(3)) + cos(th(3))*sin(th(1))*sin(th(2)))) - sin(th(6))*(sin(th(5))*(cos(th(1))*sin(th(4)) + cos(th(4))*(cos(th(2))*sin(th(1))*sin(th(3)) + cos(th(3))*sin(th(1))*sin(th(2)))) + cos(th(5))*(sin(th(1))*sin(th(2))*sin(th(3)) - cos(th(2))*cos(th(3))*sin(th(1))))- H0_6(2,2);
 
cos(th(5))*(cos(th(1))*sin(th(4)) + cos(th(4))*(cos(th(2))*sin(th(1))*sin(th(3)) + cos(th(3))*sin(th(1))*sin(th(2)))) - sin(th(5))*(sin(th(1))*sin(th(2))*sin(th(3)) - cos(th(2))*cos(th(3))*sin(th(1)))- H0_6(2,3);
 
(l7 + l8)*(cos(th(5))*(cos(th(1))*sin(th(4)) + cos(th(4))*(cos(th(2))*sin(th(1))*sin(th(3)) + cos(th(3))*sin(th(1))*sin(th(2)))) - sin(th(5))*(sin(th(1))*sin(th(2))*sin(th(3)) - cos(th(2))*cos(th(3))*sin(th(1)))) - (l5 + l6)*(sin(th(1))*sin(th(2))*sin(th(3)) - cos(th(2))*cos(th(3))*sin(th(1))) + l2*sin(th(1)) - l4*sin(th(1))*sin(th(2))- H0_6(2,4);
 
sin(th(4))*sin(th(6))*(cos(th(2))*cos(th(3)) - sin(th(2))*sin(th(3))) - cos(th(6))*(cos(th(5))*(cos(th(2))*sin(th(3)) + cos(th(3))*sin(th(2))) + cos(th(4))*sin(th(5))*(cos(th(2))*cos(th(3)) - sin(th(2))*sin(th(3))))- H0_6(3,1);
 
sin(th(6))*(cos(th(5))*(cos(th(2))*sin(th(3)) + cos(th(3))*sin(th(2))) + cos(th(4))*sin(th(5))*(cos(th(2))*cos(th(3)) - sin(th(2))*sin(th(3)))) + cos(th(6))*sin(th(4))*(cos(th(2))*cos(th(3)) - sin(th(2))*sin(th(3)))- H0_6(3,2);
 
sin(th(5))*(cos(th(2))*sin(th(3)) + cos(th(3))*sin(th(2))) - cos(th(4))*cos(th(5))*(cos(th(2))*cos(th(3)) - sin(th(2))*sin(th(3)))- H0_6(3,3);
 
l1 + l3 + (l5 + l6)*(cos(th(2))*sin(th(3)) + cos(th(3))*sin(th(2))) + (l7 + l8)*(sin(th(5))*(cos(th(2))*sin(th(3)) + cos(th(3))*sin(th(2))) - cos(th(4))*cos(th(5))*(cos(th(2))*cos(th(3)) - sin(th(2))*sin(th(3)))) + l4*cos(th(2))- H0_6(3,4);
 
];
end

% OUT
y(1) = F(1) * (180/pi);
y(2) = F(2) * (180/pi);
y(3) = F(3) * (180/pi);
y(4) = F(4) * (180/pi);
y(5) = F(5) * (180/pi);
y(6)  =F(6) * (180/pi);
% y(1) = F(1)*(180/pi);
% y(2) = F(2)*(180/pi);
% y(3) = F(3)*(180/pi);
% y(4) = F(4)*(180/pi);
% y(5) = F(5)*(180/pi);
% y(6)  =F(6)*(180/pi);
% 
% degree_per_step = 1.8;
% y(1) = (y(1)/(degree_per_step/32))/2;
% y(2) = (y(2)/(degree_per_step/32))/2;
% y(3) = (y(3)/(degree_per_step/32))/2;
% y(4) = (y(4)/(degree_per_step/32))/2;
% y(5) = (y(5)/(degree_per_step/32))/2;
% y(6) = (y(6)/(degree_per_step/32))/2;

end