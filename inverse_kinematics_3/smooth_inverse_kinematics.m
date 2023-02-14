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

function [y1,y2] = smooth_inverse_kinematics(u)

addpath C:\robot-10.2\rvctools

%  lengths of links in mm
l1 = 35; 
l2 = 20.46; 
l3 = 130;
l4 = 195;
l5 = 182;
l6 = 120.27;
l7 = 62;
l8 = 61;


 %given thetas_i
th1_i = 0;
th2_i = 0;
th3_i = 0;
th4_i = 0;
th5_i = 0;
th6_i = 0;


%the angles to orientation (Euler)
Rx = rotx(u(4)*2*pi/360);
Ry = roty(u(5)*2*pi/360);
Rz = rotz(u(6)*2*pi/360);
Rxyz = Rx*Ry*Rz;

% SOLVE
lb = [0,(-pi/4),(-pi/4),0,(-pi/4),0];
ub = [360,(5*pi/4),(5*pi/4),360,(5*pi/4),360];
th0 = [0,0,0,0,0,0];
F = lsqnonlin(@functions,th0,lb,ub);

% calculations
function F = functions(th)
F = [ - sin(th(6))*(cos(th(4))*sin(th(1)) - sin(th(4))*(cos(th(1))*cos(th(2))*sin(th(3)) - cos(th(1))*cos(th(3))*sin(th(2)))) - cos(th(6))*(sin(th(5))*(sin(th(1))*sin(th(4)) + cos(th(4))*(cos(th(1))*cos(th(2))*sin(th(3)) - cos(th(1))*cos(th(3))*sin(th(2)))) + cos(th(5))*(cos(th(1))*sin(th(2))*sin(th(3)) + cos(th(1))*cos(th(2))*cos(th(3))))-Rxyz(1,1);
      sin(th(6))*(sin(th(5))*(sin(th(1))*sin(th(4)) + cos(th(4))*(cos(th(1))*cos(th(2))*sin(th(3)) - cos(th(1))*cos(th(3))*sin(th(2)))) + cos(th(5))*(cos(th(1))*sin(th(2))*sin(th(3)) + cos(th(1))*cos(th(2))*cos(th(3)))) - cos(th(6))*(cos(th(4))*sin(th(1)) - sin(th(4))*(cos(th(1))*cos(th(2))*sin(th(3)) - cos(th(1))*cos(th(3))*sin(th(2))))-Rxyz(1,2);
      cos(th(5))*(sin(th(1))*sin(th(4)) + cos(th(4))*(cos(th(1))*cos(th(2))*sin(th(3)) - cos(th(1))*cos(th(3))*sin(th(2)))) - sin(th(5))*(cos(th(1))*sin(th(2))*sin(th(3)) + cos(th(1))*cos(th(2))*cos(th(3)))-Rxyz(1,3);
      l2*cos(th(1)) + (l7 + l8)*(cos(th(5))*(sin(th(1))*sin(th(4)) + cos(th(4))*(cos(th(1))*cos(th(2))*sin(th(3)) - cos(th(1))*cos(th(3))*sin(th(2)))) - sin(th(5))*(cos(th(1))*sin(th(2))*sin(th(3)) + cos(th(1))*cos(th(2))*cos(th(3)))) + (l5 + l6)*(cos(th(1))*sin(th(2))*sin(th(3)) + cos(th(1))*cos(th(2))*cos(th(3))) + l4*cos(th(1))*sin(th(2))-u(1);
      sin(th(6))*(cos(th(1))*cos(th(4)) + sin(th(4))*(cos(th(2))*sin(th(1))*sin(th(3)) - cos(th(3))*sin(th(1))*sin(th(2)))) + cos(th(6))*(sin(th(5))*(cos(th(1))*sin(th(4)) - cos(th(4))*(cos(th(2))*sin(th(1))*sin(th(3)) - cos(th(3))*sin(th(1))*sin(th(2)))) - cos(th(5))*(sin(th(1))*sin(th(2))*sin(th(3)) + cos(th(2))*cos(th(3))*sin(th(1))))-Rxyz(2,1);
      cos(th(6))*(cos(th(1))*cos(th(4)) + sin(th(4))*(cos(th(2))*sin(th(1))*sin(th(3)) - cos(th(3))*sin(th(1))*sin(th(2)))) - sin(th(6))*(sin(th(5))*(cos(th(1))*sin(th(4)) - cos(th(4))*(cos(th(2))*sin(th(1))*sin(th(3)) - cos(th(3))*sin(th(1))*sin(th(2)))) - cos(th(5))*(sin(th(1))*sin(th(2))*sin(th(3)) + cos(th(2))*cos(th(3))*sin(th(1))))-Rxyz(2,2);
      - cos(th(5))*(cos(th(1))*sin(th(4)) - cos(th(4))*(cos(th(2))*sin(th(1))*sin(th(3)) - cos(th(3))*sin(th(1))*sin(th(2)))) - sin(th(5))*(sin(th(1))*sin(th(2))*sin(th(3)) + cos(th(2))*cos(th(3))*sin(th(1)))-Rxyz(2,3);
      (l5 + l6)*(sin(th(1))*sin(th(2))*sin(th(3)) + cos(th(2))*cos(th(3))*sin(th(1))) - (l7 + l8)*(cos(th(5))*(cos(th(1))*sin(th(4)) - cos(th(4))*(cos(th(2))*sin(th(1))*sin(th(3)) - cos(th(3))*sin(th(1))*sin(th(2)))) + sin(th(5))*(sin(th(1))*sin(th(2))*sin(th(3)) + cos(th(2))*cos(th(3))*sin(th(1)))) + l2*sin(th(1)) + l4*sin(th(1))*sin(th(2))-u(2);
      - cos(th(6))*(cos(th(5))*(cos(th(2))*sin(th(3)) - cos(th(3))*sin(th(2))) - cos(th(4))*sin(th(5))*(cos(th(2))*cos(th(3)) + sin(th(2))*sin(th(3)))) - sin(th(4))*sin(th(6))*(cos(th(2))*cos(th(3)) + sin(th(2))*sin(th(3)))-Rxyz(3,1);
      sin(th(6))*(cos(th(5))*(cos(th(2))*sin(th(3)) - cos(th(3))*sin(th(2))) - cos(th(4))*sin(th(5))*(cos(th(2))*cos(th(3)) + sin(th(2))*sin(th(3)))) - cos(th(6))*sin(th(4))*(cos(th(2))*cos(th(3)) + sin(th(2))*sin(th(3)))-Rxyz(3,2);
      - sin(th(5))*(cos(th(2))*sin(th(3)) - cos(th(3))*sin(th(2))) - cos(th(4))*cos(th(5))*(cos(th(2))*cos(th(3)) + sin(th(2))*sin(th(3)))-Rxyz(3,3);
      l1 + l3 + (l5 + l6)*(cos(th(2))*sin(th(3)) - cos(th(3))*sin(th(2))) - (l7 + l8)*(sin(th(5))*(cos(th(2))*sin(th(3)) - cos(th(3))*sin(th(2))) + cos(th(4))*cos(th(5))*(cos(th(2))*cos(th(3)) + sin(th(2))*sin(th(3)))) + l4*cos(th(2))-u(3);];
end

qi = ([th1_i th2_i th3_i th4_i th5_i th6_i]);            
qf = ([F(1) F(2) F(3) F(4) F(5) F(6)]);
t = [0: .05: 5]';
length (t);
[y1 y2] = jtraj(qi, qf, length(t));

%  degree_per_step = 1.8;
%  for i=1:1:101,j=1:1:6
%  y1(i,j)
%  y1(i,j) = (y1(i,j)/(degree_per_step/32));
%  end
%  for i=1:1:101,j=1:1:6
%  y2(i,j)
%  y2(i,j) = (y2(i,j)/(degree_per_step/32));
%  end
end