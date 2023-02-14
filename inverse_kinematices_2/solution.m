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


function y = solution(u)

% addpath C:\robot-10.2\rvctools
% startup_rvc
%the angles to orientation (Euler)
Rx = rotx(u(4)*2*pi/360);
Ry = roty(u(5)*2*pi/360);
Rz = rotz(u(6)*2*pi/360);
Rxyz = Rx*Ry*Rz;

% SOLVE
lb = [0,(-pi/4),(-pi/4),0,(-pi/4),0];
ub = [360,(5*pi/4),(5*pi/4),360,(5*pi/4),360];
th0 = [0,0,0,0,0,0];
F = lsqnonlin(@our_robot_vr2,th0,lb,ub);

% calculations
function F = our_robot_vr2(th)
F = [ sin(th(6))*(cos(th(4))*sin(th(1)) + sin(th(4))*(cos(th(1))*sin(th(2))*sin(th(3)) - cos(th(1))*cos(th(2))*cos(th(3)))) + cos(th(6))*(sin(th(5))*(sin(th(1))*sin(th(4)) - cos(th(4))*(cos(th(1))*sin(th(2))*sin(th(3)) - cos(th(1))*cos(th(2))*cos(th(3)))) + cos(th(5))*(cos(th(1))*cos(th(2))*sin(th(3)) + cos(th(1))*cos(th(3))*sin(th(2))))-Rxyz(1,1);
      cos(th(6))*(cos(th(4))*sin(th(1)) + sin(th(4))*(cos(th(1))*sin(th(2))*sin(th(3)) - cos(th(1))*cos(th(2))*cos(th(3)))) - sin(th(6))*(sin(th(5))*(sin(th(1))*sin(th(4)) - cos(th(4))*(cos(th(1))*sin(th(2))*sin(th(3)) - cos(th(1))*cos(th(2))*cos(th(3)))) + cos(th(5))*(cos(th(1))*cos(th(2))*sin(th(3)) + cos(th(1))*cos(th(3))*sin(th(2))))-Rxyz(1,2);
      sin(th(5))*(cos(th(1))*cos(th(2))*sin(th(3)) + cos(th(1))*cos(th(3))*sin(th(2))) - cos(th(5))*(sin(th(1))*sin(th(4)) - cos(th(4))*(cos(th(1))*sin(th(2))*sin(th(3)) - cos(th(1))*cos(th(2))*cos(th(3))))-Rxyz(1,3);
      10*cos(th(1)) + 190*cos(th(1))*cos(th(2)) - 131*cos(th(5))*(sin(th(1))*sin(th(4)) - cos(th(4))*(cos(th(1))*sin(th(2))*sin(th(3)) - cos(th(1))*cos(th(2))*cos(th(3)))) + 131*sin(th(5))*(cos(th(1))*cos(th(2))*sin(th(3)) + cos(th(1))*cos(th(3))*sin(th(2))) + (30047*cos(th(1))*cos(th(2))*sin(th(3)))/100 + (30047*cos(th(1))*cos(th(3))*sin(th(2)))/100-u(1);
      - sin(th(6))*(cos(th(1))*cos(th(4)) - sin(th(4))*(sin(th(1))*sin(th(2))*sin(th(3)) - cos(th(2))*cos(th(3))*sin(th(1)))) - cos(th(6))*(sin(th(5))*(cos(th(1))*sin(th(4)) + cos(th(4))*(sin(th(1))*sin(th(2))*sin(th(3)) - cos(th(2))*cos(th(3))*sin(th(1)))) - cos(th(5))*(cos(th(2))*sin(th(1))*sin(th(3)) + cos(th(3))*sin(th(1))*sin(th(2))))-Rxyz(2,1);
      sin(th(6))*(sin(th(5))*(cos(th(1))*sin(th(4)) + cos(th(4))*(sin(th(1))*sin(th(2))*sin(th(3)) - cos(th(2))*cos(th(3))*sin(th(1)))) - cos(th(5))*(cos(th(2))*sin(th(1))*sin(th(3)) + cos(th(3))*sin(th(1))*sin(th(2)))) - cos(th(6))*(cos(th(1))*cos(th(4)) - sin(th(4))*(sin(th(1))*sin(th(2))*sin(th(3)) - cos(th(2))*cos(th(3))*sin(th(1))))-Rxyz(2,2);
      cos(th(5))*(cos(th(1))*sin(th(4)) + cos(th(4))*(sin(th(1))*sin(th(2))*sin(th(3)) - cos(th(2))*cos(th(3))*sin(th(1)))) + sin(th(5))*(cos(th(2))*sin(th(1))*sin(th(3)) + cos(th(3))*sin(th(1))*sin(th(2)))-Rxyz(2,3);
      10*sin(th(1)) + 190*cos(th(2))*sin(th(1)) + 131*cos(th(5))*(cos(th(1))*sin(th(4)) + cos(th(4))*(sin(th(1))*sin(th(2))*sin(th(3)) - cos(th(2))*cos(th(3))*sin(th(1)))) + 131*sin(th(5))*(cos(th(2))*sin(th(1))*sin(th(3)) + cos(th(3))*sin(th(1))*sin(th(2))) + (30047*cos(th(2))*sin(th(1))*sin(th(3)))/100 + (30047*cos(th(3))*sin(th(1))*sin(th(2)))/100-u(2);
      - cos(th(6))*(cos(th(5))*(cos(th(2))*cos(th(3)) - sin(th(2))*sin(th(3))) - cos(th(4))*sin(th(5))*(cos(th(2))*sin(th(3)) + cos(th(3))*sin(th(2)))) - sin(th(4))*sin(th(6))*(cos(th(2))*sin(th(3)) + cos(th(3))*sin(th(2)))-Rxyz(3,1);
      sin(th(6))*(cos(th(5))*(cos(th(2))*cos(th(3)) - sin(th(2))*sin(th(3))) - cos(th(4))*sin(th(5))*(cos(th(2))*sin(th(3)) + cos(th(3))*sin(th(2)))) - cos(th(6))*sin(th(4))*(cos(th(2))*sin(th(3)) + cos(th(3))*sin(th(2)))-Rxyz(3,2);
      - sin(th(5))*(cos(th(2))*cos(th(3)) - sin(th(2))*sin(th(3))) - cos(th(4))*cos(th(5))*(cos(th(2))*sin(th(3)) + cos(th(3))*sin(th(2)))-Rxyz(3,3);
      190*sin(th(2)) - (30047*cos(th(2))*cos(th(3)))/100 + (30047*sin(th(2))*sin(th(3)))/100 - 131*sin(th(5))*(cos(th(2))*cos(th(3)) - sin(th(2))*sin(th(3))) - 131*cos(th(4))*cos(th(5))*(cos(th(2))*sin(th(3)) + cos(th(3))*sin(th(2))) + 165-u(3);];
end

% OUT
y(1) = F(1)*(180/pi);
y(2) = F(2)*(180/pi);
y(3) = F(3)*(180/pi);
y(4) = F(4)*(180/pi);
y(5) = F(5)*(180/pi);
y(6)  =F(6)*(180/pi);


degree_per_step = 1.8;
y(1) = (y(1)/(degree_per_step/32))/2;
y(2) = (y(2)/(degree_per_step/32))/2;
y(3) = (y(3)/(degree_per_step/32))/2;
y(4) = (y(4)/(degree_per_step/32))/2;
y(5) = (y(5)/(degree_per_step/32))/2;
y(6) = (y(6)/(degree_per_step/32))/2;

% degree_per_step = 1.8;
% y(1) = (y(1)/(degree_per_step/32));
% y(2) = (y(2)/(degree_per_step/32));
% y(3) = (y(3)/(degree_per_step/32));
% y(4) = (y(4)/(degree_per_step/32));
% y(5) = (y(5)/(degree_per_step/32));
% y(6) = (y(6)/(degree_per_step/32));


end


% %given thetas_i
% u(1) = 0
% u(2) = 0
% u(3) = 0
% u(4) = 0
% u(5) = 0
% u(6) = 0
% 
% %given thetas_f
% u(7) = pi/4
% u(8) = pi/4
% u(9) = pi/4
% u(10) = pi/4
% u(11) = pi/4
% u(12) = pi/4
% function y = solution(u)
% %peter corke Robotics toolbox path
% addpath C:\robot-10.2\rvctools
% startup_rvc
% 
%  
% 
% qi = ([u(1) u(2) u(3) u(4) u(5) u(6)])            
% qf = ([u(7) u(8) u(9) u(10) u(11) u(12)])
% 
% t = [0: .05: 5]'
% length (t)
% 
% y = jtraj(qi, qf, length(t))
% % for i=1:1:101,j=1:1:6
% % y(i,j)
% % end
% 
% % [q qd qdd]= jtraj(qi, qf, length(t))
% % 
% % qd
% % q(27,1)
% end