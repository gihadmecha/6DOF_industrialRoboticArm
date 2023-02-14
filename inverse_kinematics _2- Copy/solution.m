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


%the angles to orientation (Euler)
Rx = rotx(u(4)*2*pi/360);
Ry = roty(u(5)*2*pi/360);
Rz = rotz(u(6)*2*pi/360);
Rxyz = Rx*Ry*Rz;

% SOLVE
th0 = [0;0;0;0;0;0];
F = fsolve(@our_robot_vr2,th0);

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

end
