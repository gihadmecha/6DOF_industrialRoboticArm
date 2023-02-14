
function y = jacobian_try(u)

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

th1_i = 0;
th2_i = 0;
th3_i = 0;
th4_i = 0;
th5_i = 0;
th6_i = 0;

angle1 = th1_i;
angle2 = th2_i; 
angle3 = th3_i; 
angle4 = th4_i; 
angle5 = th5_i; 
angle6 = th6_i; 

while (angle1  F(1))&&(angle2 ~= F(2))&&(angle3 ~= F(3))&&(angle4 ~= F(4))&&(angle5 ~= F(5))&&(angle6 ~= F(6))
    
H0_1 = [cos(angle1)      0      sin(angle1)   l2*cos(angle1);
        sin(angle1)      0     -cos(angle1)   l2*sin(angle1);
           0             1         0            l1+l3 ;
           0             0         0               1  ] ;
       
H1_2 = [sin(angle2)  -cos(angle2)     0   l4*sin(angle2) ;
        cos(angle2)   sin(angle2)     0   l4*cos(angle2) ;
           0             0            1      0        ;
           0             0            0      1        ];
       
H2_3 = [cos(angle3)      0     sin(angle3)    0  ;
        sin(angle3)      0    -cos(angle3)    0  ;
          0             -1         0          0  ;
          0              0         0          1  ];
      
H3_4 = [cos(angle4)      0    -sin(angle4)     0    ;
        sin(angle4)      0     cos(angle4)     0    ; 
          0             -1         0        l5+l6  ;
          0              0         0          1    ];

H4_5 = [ sin(angle5)    0    -cos(angle5)    0 ;
         cos(angle5)    0     sin(angle5)    0 ;
          0             1         0          0 ; 
          0             0         0          1 ];

H5_6 = [cos(angle6)  -sin(angle6)     0      0   ;
        sin(angle6)   cos(angle6)     0      0   ;
           0             0            1    l7+l8 ;
           0             0            0      1   ];

       
H0_0 = eye(4);
H0_1;
H0_2 = H0_1 * H1_2;
H0_3 = H0_1 * H1_2 * H2_3; 
H0_4 = H0_1 * H1_2 * H2_3 * H3_4; 
H0_5 = H0_1 * H1_2 * H2_3 * H3_4 * H4_5;
H0_6 = H0_1 * H1_2 * H2_3 * H3_4 * H4_5 * H5_6;       
       

j(1:3,1)=cross(H0_0(1:3,1:3)*[0;0;1],(H0_6(1:3,4)-H0_0(1:3,4)));
j(4:6,1)=H0_0(1:3,1:3)*[0;0;1];

j(1:3,2)=cross(H0_1(1:3,1:3)*[0;0;1],(H0_6(1:3,4)-H0_1(1:3,4)));
j(4:6,2)=H0_1(1:3,1:3)*[0;0;1];

j(1:3,3)=cross(H0_2(1:3,1:3)*[0;0;1],(H0_6(1:3,4)-H0_2(1:3,4)));
j(4:6,3)=H0_2(1:3,1:3)*[0;0;1];

j(1:3,4)=cross(H0_3(1:3,1:3)*[0;0;1],(H0_6(1:3,4)-H0_3(1:3,4)));
j(4:6,4)=H0_3(1:3,1:3)*[0;0;1];

j(1:3,5)=cross(H0_4(1:3,1:3)*[0;0;1],(H0_6(1:3,4)-H0_4(1:3,4)));
j(4:6,5)=H0_4(1:3,1:3)*[0;0;1];

j(1:3,6)=cross(H0_5(1:3,1:3)*[0;0;1],(H0_6(1:3,4)-H0_5(1:3,4)));
j(4:6,6)=H0_5(1:3,1:3)*[0;0;1];

inverse_jacobian = inv(j);

end_effector_velocity = [x_dot;y_dot;z_dot;w_x;w_y;w_z];
       
joints_velocities = inverse_jacobian * end_effector_velocity ;

theta1_dot = joints_velocities(1,1);
theta2_dot = joints_velocities(2,1);
theta3_dot = joints_velocities(3,1);
theta4_dot = joints_velocities(4,1);
theta5_dot = joints_velocities(5,1);
theta6_dot = joints_velocities(6,1);

angle1 = angle1 + theta1_dot;
angle2 = angle2 + theta2_dot;
angle3 = angle3 + theta3_dot;
angle4 = angle4 + theta4_dot;
angle5 = angle5 + theta5_dot;
angle6 = angle6 + theta6_dot;

% OUT
y(1) = angle1*(180/pi);
y(2) = angle2*(180/pi);
y(3) = angle3*(180/pi);
y(4) = angle4*(180/pi);
y(5) = angle5*(180/pi);
y(6) = angle6*(180/pi);

end
end
