clear
clc


%lengths of links in mm
l1 = 215.5;
l2 = 19.58 ;
l3 = 173;
l4 = 195;
l5 = 182;
l6 = 120.27;
l7 = 62;
l8 = 61;

%given thetas
th1 = 50 
th2 = 30
th3 = -10.7738
th4 = 15
th5 = 10
th6 = -74.1101

% %given thetas
% th1 = 0 
% th2 = 0
% th3 = 0
% th4 = 0
% th5 = 0
% th6 = 0

th1 = th1*(pi/180);
th2 = th2*(pi/180);
th3 = th3*(pi/180);
th4 = th4*(pi/180);
th5 = th5*(pi/180);
th6 = th6*(pi/180);
% syms th1 th2 th3 th4 th5 th6 l1 l2 l3 l4 l5 l6 l7 l8 x_dot y_dot z_dot w_x w_y w_z

 %HTM 0_1  
H0_1 = [cos(th1)        0                     sin(th1)         l2*cos(th1)  ;
        sin(th1)        0                    -cos(th1)         l2*sin(th1)  ;
           0            1                     0                l1+l3 ;
           0            0                     0                1  ] ;
%HTM 1_2        
H1_2 = [cos(th2+pi/2)  -sin(th2+pi/2)         0                l4*cos(th2+pi/2) ;
        sin(th2+pi/2)   cos(th2+pi/2)         0                l4*sin(th2+pi/2) ;
           0            0                     1                0        ;
           0            0                     0                1        ];
%HTM 2_3         
H2_3 = [cos(th3+pi)     0                    -sin(th3+pi)      0  ;
        sin(th3+pi)     0                     cos(th3+pi)      0  ;
          0            -1                     0                0  ;
          0             0                     0                1  ];
%HTM 3_4         
H3_4 = [cos(th4+pi)     0                    -sin(th4+pi)      0 ;
        sin(th4+pi)     0                     cos(th4+pi)      0 ; 
          0            -1                     0                l5+l6  ;
          0             0                     0                1    ];
%HTM 4_5  
H4_5 = [cos(th5+pi/2)   0                    -sin(th5+pi/2)    0 ;
        sin(th5+pi/2)   0                     cos(th5+pi/2)    0 ;
        0              -1                     0                0 ; 
        0               0                     0                1 ];
%HTM 5_6  
H5_6 = [cos(th6)       -sin(th6)              0                0   ;
        sin(th6)        cos(th6)              0                0   ;
           0            0                     1                l7+l8 ;
           0            0                     0                1   ];
       
       
H0_0 = eye(4)
H0_1
H0_2 = H0_1 * H1_2
H0_3 = H0_1 * H1_2 * H2_3 
H0_4 = H0_1 * H1_2 * H2_3 * H3_4 
H0_5 = H0_1 * H1_2 * H2_3 * H3_4 * H4_5
H0_6 = H0_1 * H1_2 * H2_3 * H3_4 * H4_5 * H5_6       
       

j(1:3,1)=cross(H0_0(1:3,1:3)*[0;0;1],(H0_6(1:3,4)-H0_0(1:3,4)))
j(4:6,1)=H0_0(1:3,1:3)*[0;0;1]

j(1:3,2)=cross(H0_1(1:3,1:3)*[0;0;1],(H0_6(1:3,4)-H0_1(1:3,4)))
j(4:6,2)=H0_1(1:3,1:3)*[0;0;1]

j(1:3,3)=cross(H0_2(1:3,1:3)*[0;0;1],(H0_6(1:3,4)-H0_2(1:3,4)))
j(4:6,3)=H0_2(1:3,1:3)*[0;0;1]

j(1:3,4)=cross(H0_3(1:3,1:3)*[0;0;1],(H0_6(1:3,4)-H0_3(1:3,4)))
j(4:6,4)=H0_3(1:3,1:3)*[0;0;1]

j(1:3,5)=cross(H0_4(1:3,1:3)*[0;0;1],(H0_6(1:3,4)-H0_4(1:3,4)))
j(4:6,5)=H0_4(1:3,1:3)*[0;0;1]

j(1:3,6)=cross(H0_5(1:3,1:3)*[0;0;1],(H0_6(1:3,4)-H0_5(1:3,4)))
j(4:6,6)=H0_5(1:3,1:3)*[0;0;1]

j

% inverse_jacobian = inv(j)
% 
% end_effector_velocity = [x_dot;y_dot;z_dot;w_x;w_y;w_z]
%        
% joints_velocities = inverse_jacobian * end_effector_velocity    
       