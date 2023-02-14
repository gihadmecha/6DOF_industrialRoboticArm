
function K = hemogenous_transformation_matrix_v2(orien)

 %lengths of links in mm
l1 = 215.5;   %35; 
l2 = 19.58;   %20.46; 
l3 = 173;
l4 = 195;
l5 = 182;
l6 = 120.27;
l7 = 62;
l8 = 61;

%  %given thetas
th1 = orien(1) ; 
th2 = orien(2) ;
th3 = orien(3) ;
th4 = orien(4) ;
th5 = orien(5) ;
th6 = orien(6) ;

% th1 = th1* (pi/180)
% th2 = th2* (pi/180)
% th3 = th3* (pi/180)
% th4 = th4* (pi/180)
% th5 = th5* (pi/180)
% th6 = th6* (pi/180)

% syms th1 th2 th3 th4 th5 th6 l1 l2 l3 l4 l5 l6 l7 l8
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
       
%HTM 0_6  
H0_6 = H0_1 * H1_2 * H2_3 * H3_4 * H4_5 * H5_6


% %HTM 0_2
% H0_2 = H0_1 * H1_2 ;
% 
% %HTM 0_3
% H0_3 = H0_2 * H2_3 ;
% 
% %HTM 0_4
% H0_4 = H0_3 * H3_4 ;
% 
% %HTM 0_5
% H0_5 = H0_4 * H4_5 ;

%HTM 0_6 Elements  
% nx = H0_6(1,1);
% ox = H0_6(1,2);
% ax=H0_6(1,3);
% px=H0_6(1,4);
% ny=H0_6(2,1);
% oy=H0_6(2,2);
% ay=H0_6(2,3);
% py=H0_6(2,4);
% nz=H0_6(3,1);
% oz=H0_6(3,2);
% az=H0_6(3,3);
% pz=H0_6(3,4);
% c= [nx ox ax;
%     ny oy ay;
%     nz oz az]
% H0_6=tr2rpy(c)
% POS(1)=px
% POS(2)=py
% POS(3)=pz
% POS(4)=H0_6(1)*(180/pi)
% POS(5)=H0_6(2)*(180/pi)
% POS(6)=H0_6(3)*(180/pi)
lb = [-pi ,-pi ,-pi  ];
ub = [+pi ,pi  ,pi  ];
orien_0 = [0,0,0,0,0,0];
L = lsqnonlin(@orientation,orien_0,lb,ub);
% F = fsolve(@functions,th0);
H0_6(1,1);
% calculations

function L = orientation(orien)
L = [ 
 cos((pi*orien(2))/180)*cos((pi*orien(3))/180)-H0_6(1,1);
-cos((pi*orien(2))/180)*sin((pi*orien(3))/180)-H0_6(1,2);
sin((pi*orien(2))/180)-H0_6(1,3);
cos((pi*orien(1))/180)*sin((pi*orien(3))/180) + cos((pi*orien(3))/180)*sin((pi*orien(1))/180)*sin((pi*orien(2))/180)-H0_6(2,1);
cos((pi*orien(1))/180)*cos((pi*orien(3))/180) - sin((pi*orien(1))/180)*sin((pi*orien(2))/180)*sin((pi*orien(3))/180)-H0_6(2,2);
-cos((pi*orien(2))/180)*sin((pi*orien(1))/180)-H0_6(2,3);
sin((pi*orien(1))/180)*sin((pi*orien(3))/180) - cos((pi*orien(1))/180)*cos((pi*orien(3))/180)*sin((pi*orien(2))/180)-H0_6(3,1);
cos((pi*orien(3))/180)*sin((pi*orien(1))/180) + cos((pi*orien(1))/180)*sin((pi*orien(2))/180)*sin((pi*orien(3))/180)-H0_6(3,2);
cos((pi*orien(1))/180)*cos((pi*orien(2))/180)-H0_6(3,3);

    ];
end
K(1) = H0_6(1,4);
K(2) = H0_6(2,4);
K(3) = H0_6(3,4);
K(4) = orien(1)*(180/pi);
K(5) = orien(2)*(180/pi);
K(6) = orien(3)*(180/pi);
% 
% %Rotation Matrix For Jacobian
% R0_0=eye(3);
% R0_1=H0_1(1:3,1:3); %Rotatiom matrix R0_1
% R0_2=H0_2(1:3,1:3); %Rotatiom matrix R0_2
% R0_3=H0_3(1:3,1:3); %Rotatiom matrix R0_3
% R0_4=H0_4(1:3,1:3); %Rotatiom matrix R0_4
% R0_5=H0_5(1:3,1:3); %Rotatiom matrix R0_5
% 
% %displacemnt vectors for Jacobian
% d0_0=[0;0;0]    ; %displacemnt vector d0_0
% d0_1=H0_1(1:3,4); %displacemnt vector d0_1
% d0_2=H0_2(1:3,4); %displacemnt vector d0_1
% d0_3=H0_3(1:3,4); %displacemnt vector d0_1
% d0_4=H0_4(1:3,4); %displacemnt vector d0_1
% d0_5=H0_5(1:3,4); %displacemnt vector d0_1
% d0_6=H0_6(1:3,4); %displacemnt vector d0_1
% 
% %  Jacobian Matrix Elements
% J(1:3,1)=cross(R0_0*[0;0;1],[d0_6-d0_0]);
% J(1:3,2)=cross(R0_1*[0;0;1],[d0_6-d0_1]);
% J(1:3,3)=cross(R0_2*[0;0;1],[d0_6-d0_2]);
% J(1:3,4)=cross(R0_3*[0;0;1],[d0_6-d0_3]);
% J(1:3,5)=cross(R0_4*[0;0;1],[d0_6-d0_4]);
% J(1:3,6)=cross(R0_5*[0;0;1],[d0_6-d0_5]);
% 
% J(4:6,1)=[R0_0*[0;0;1]];
% J(4:6,2)=[R0_1*[0;0;1]];
% J(4:6,3)=[R0_2*[0;0;1]];
% J(4:6,4)=[R0_3*[0;0;1]];
% J(4:6,5)=[R0_4*[0;0;1]];
% J(4:6,6)=[R0_5*[0;0;1]];
% J_inv=inv(J)
end