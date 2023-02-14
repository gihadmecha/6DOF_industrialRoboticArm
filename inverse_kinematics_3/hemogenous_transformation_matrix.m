clear
clc

 %given thetas in degrees
th1 = -40.7096 ; 
th2 = 34.6655 ;
th3 = -10.7738 ;
th4 = 40.9022 ;
th5 = 47.2396 ;
th6 = -74.1101 ;

% %given thetas in degrees
% th1 = 0 ; 
% th2 = 0 ;
% th3 = 0 ;
% th4 = 0 ;
% th5 = 0 ;
% th6 = 0 ;
 %given thetas in radians
th1 = th1 * (pi/180);
th2 = th2 * (pi/180);
th3 = th3 * (pi/180);
th4 = th4 * (pi/180);
th5 = th5 * (pi/180);
th6 = th6 * (pi/180);
% 
 %lengths of links in mm
l1 = 215.5;   %35; 
l2 = 19.58;   %20.46; 
l3 = 173;
l4 = 195;
l5 = 182;
l6 = 120.27;
l7 = 62;
l8 = 61;

% % syms th1 th2 th3 th4 th5 th6
% % syms th1 th2 th3 th4 th5 th6 l1 l2 l3 l4 l5 l6 l7 l8 
% 
H0_1 = [ cos(th1)   0          sin(th1)   l2*cos(th1) ;
         sin(th1)   0         -cos(th1)   l2*sin(th1) ;
         0          1          0          l1+l3       ;
         0          0          0          1           ]; 
       
H1_2 = [-sin(th2)  -cos(th2)   0         -l4*sin(th2) ;
         cos(th2)  -sin(th2)   0          l4*cos(th2) ;
         0          0          1          0           ;
         0          0          0          1           ];
       
H2_3 = [-cos(th3)   0          sin(th3)    0          ;
        -sin(th3)   0         -cos(th3)    0          ;
         0         -1          0           0          ;
         0          0          0           1          ];
      
H3_4 = [-cos(th4)   0         sin(th4)     0          ;
        -sin(th4)   0        -cos(th4)     0          ;
         0         -1          0           l5+l6      ;
         0          0          0           1          ];

H4_5 = [-sin(th5)   0         -cos(th5)    0          ;
         cos(th5)   0         -sin(th5)    0          ;
         0         -1          0           0          ; 
         0          0          0           1          ];

H5_6 = [ cos(th6) -sin(th6)    0           0          ;
         sin(th6)  cos(th6)    0           0          ;
         0         0           1           l7+l8      ;
         0         0           0           1          ];
     
H0_6 = H0_1 * H1_2 * H2_3 * H3_4 * H4_5 * H5_6



% nx = H0_6(1,1)
% ox = H0_6(1,2)
% ax = H0_6(1,3)
% px = H0_6(1,4)
% ny = H0_6(2,1)
% oy = H0_6(2,2)
% ay = H0_6(2,3)
% py = H0_6(2,4)
% nz = H0_6(3,1)
% oz = H0_6(3,2)
% az = H0_6(3,3)
% pz = H0_6(3,4)
       