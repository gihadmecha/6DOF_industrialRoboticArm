% x == X
% y == Y
% z == Z
% alpha == alpha
% beta == beta
% gamma == gamma
% 
% th_1 = th(1)
% th_2 = th(2)
% th_3 = th(3)
% th_4 = th(4)
% th_5 = th(5)
% th_6 = th(6)

function [th_1, th_2, th_3, th_4, th_5, th_6] = inverse_kinematics_v2(x, y)

z = 0;

% Rxyz(1,1) = 1;Rxyz(1,2) = 0;Rxyz(1,3) = 0;
% Rxyz(2,1) = 0;Rxyz(2,2) = 1;Rxyz(2,3) = 0;
% Rxyz(3,1) = 0;Rxyz(3,2) = 0;Rxyz(3,3) = 1;
alpha = 0 ;
beta = 180;
gamma = 0 ;

%  lengths of links in mm
l1 = 215.5;   %35; 
l2 = 19.58;   %20.46; 
l3 = 173;
l4 = 195;
l5 = 182;
l6 = 120.27;
l7 = 62;
l8 = 61;

% angles to orientation (Euler)
% Rx = rotx(alpha*2*pi/360);
% Ry = roty(beta*2*pi/360);
% Rz = rotz(gamma*2*pi/360);
% Rxyz = Rx*Ry*Rz;

alpha = alpha*2*pi/360;
beta =beta*2*pi/360;
gamma = gamma*2*pi/360;

Rx = [1           0          0        ;
      0           cos(alpha) -sin(alpha);
      0           sin(alpha) cos(alpha)] ; 
  
Ry = [cos(beta)   0          sin(beta);
      0           1          0        ;
      -sin(beta)  0          cos(beta)];
  
Rz = [cos(gamma) -sin(gamma) 0;
      sin(gamma)  cos(gamma) 0;
      0           0          1];

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
(l5 + l6)*(cos(th(1))*cos(th(3))*sin(th(2) + pi/2) + cos(th(1))*cos(th(2) + pi/2)*sin(th(3))) - (l7 + l8)*(sin(th(5) + pi/2)*(sin(th(1))*sin(th(4)) - cos(th(4))*(cos(th(1))*sin(th(3))*sin(th(2) + pi/2) - cos(th(1))*cos(th(3))*cos(th(2) + pi/2))) + cos(th(5) + pi/2)*(cos(th(1))*cos(th(3))*sin(th(2) + pi/2) + cos(th(1))*cos(th(2) + pi/2)*sin(th(3)))) + l2*cos(th(1)) + l4*cos(th(1))*cos(th(2) + pi/2)-x;
sin(th(6))*(cos(th(1))*cos(th(4)) + sin(th(4))*(cos(th(3))*cos(th(2) + pi/2)*sin(th(1)) - sin(th(1))*sin(th(3))*sin(th(2) + pi/2))) - cos(th(6))*(cos(th(5) + pi/2)*(cos(th(1))*sin(th(4)) - cos(th(4))*(cos(th(3))*cos(th(2) + pi/2)*sin(th(1)) - sin(th(1))*sin(th(3))*sin(th(2) + pi/2))) + sin(th(5) + pi/2)*(cos(th(3))*sin(th(1))*sin(th(2) + pi/2) + cos(th(2) + pi/2)*sin(th(1))*sin(th(3))))-Rxyz(2,1);
sin(th(6))*(cos(th(5) + pi/2)*(cos(th(1))*sin(th(4)) - cos(th(4))*(cos(th(3))*cos(th(2) + pi/2)*sin(th(1)) - sin(th(1))*sin(th(3))*sin(th(2) + pi/2))) + sin(th(5) + pi/2)*(cos(th(3))*sin(th(1))*sin(th(2) + pi/2) + cos(th(2) + pi/2)*sin(th(1))*sin(th(3)))) + cos(th(6))*(cos(th(1))*cos(th(4)) + sin(th(4))*(cos(th(3))*cos(th(2) + pi/2)*sin(th(1)) - sin(th(1))*sin(th(3))*sin(th(2) + pi/2)))-Rxyz(2,2);
sin(th(5) + pi/2)*(cos(th(1))*sin(th(4)) - cos(th(4))*(cos(th(3))*cos(th(2) + pi/2)*sin(th(1)) - sin(th(1))*sin(th(3))*sin(th(2) + pi/2))) - cos(th(5) + pi/2)*(cos(th(3))*sin(th(1))*sin(th(2) + pi/2) + cos(th(2) + pi/2)*sin(th(1))*sin(th(3)))-Rxyz(2,3);
(l5 + l6)*(cos(th(3))*sin(th(1))*sin(th(2) + pi/2) + cos(th(2) + pi/2)*sin(th(1))*sin(th(3))) + (l7 + l8)*(sin(th(5) + pi/2)*(cos(th(1))*sin(th(4)) - cos(th(4))*(cos(th(3))*cos(th(2) + pi/2)*sin(th(1)) - sin(th(1))*sin(th(3))*sin(th(2) + pi/2))) - cos(th(5) + pi/2)*(cos(th(3))*sin(th(1))*sin(th(2) + pi/2) + cos(th(2) + pi/2)*sin(th(1))*sin(th(3)))) + l2*sin(th(1)) + l4*cos(th(2) + pi/2)*sin(th(1))-y;
cos(th(6))*(sin(th(5) + pi/2)*(cos(th(3))*cos(th(2) + pi/2) - sin(th(3))*sin(th(2) + pi/2)) + cos(th(4))*cos(th(5) + pi/2)*(cos(th(3))*sin(th(2) + pi/2) + cos(th(2) + pi/2)*sin(th(3)))) + sin(th(4))*sin(th(6))*(cos(th(3))*sin(th(2) + pi/2) + cos(th(2) + pi/2)*sin(th(3)))-Rxyz(3,1);
cos(th(6))*sin(th(4))*(cos(th(3))*sin(th(2) + pi/2) + cos(th(2) + pi/2)*sin(th(3))) - sin(th(6))*(sin(th(5) + pi/2)*(cos(th(3))*cos(th(2) + pi/2) - sin(th(3))*sin(th(2) + pi/2)) + cos(th(4))*cos(th(5) + pi/2)*(cos(th(3))*sin(th(2) + pi/2) + cos(th(2) + pi/2)*sin(th(3))))-Rxyz(3,2);
cos(th(5) + pi/2)*(cos(th(3))*cos(th(2) + pi/2) - sin(th(3))*sin(th(2) + pi/2)) - cos(th(4))*sin(th(5) + pi/2)*(cos(th(3))*sin(th(2) + pi/2) + cos(th(2) + pi/2)*sin(th(3)))-Rxyz(3,3);
l1 + l3 - (l5 + l6)*(cos(th(3))*cos(th(2) + pi/2) - sin(th(3))*sin(th(2) + pi/2)) + l4*sin(th(2) + pi/2) + (l7 + l8)*(cos(th(5) + pi/2)*(cos(th(3))*cos(th(2) + pi/2) - sin(th(3))*sin(th(2) + pi/2)) - cos(th(4))*sin(th(5) + pi/2)*(cos(th(3))*sin(th(2) + pi/2) + cos(th(2) + pi/2)*sin(th(3))))-z
];
end

%OUT
th_1 = F(1);
th_2 = F(2);
th_3 = F(3);
th_4 = F(4);
th_5 = F(5);
th_6 = F(6);

end