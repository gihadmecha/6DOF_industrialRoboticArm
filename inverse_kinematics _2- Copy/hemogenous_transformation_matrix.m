clear
clc


 %lengths of links in mm
l1 = 35 
l2 = 10 
l3 = 130
l4 = 190
l5 = 183
l6 = 117.47
l7 = 63
l8 = 68

syms th1 th2 th3 th4 th5 th6

H0_1 = [cos(th1)      0      sin(th1)   l2*cos(th1)  ;
        sin(th1)      0     -cos(th1)   l2*sin(th1)  ;
           0          1         0       l1+l3 ;
           0          0         0       1  ] 
       
H1_2 = [cos(th2)  -sin(th2)     0   l4*cos(th2) ;
        sin(th2)   cos(th2)     0   l4*sin(th2) ;
           0          0         1      0        ;
           0          0         0      1        ]
       
H2_3 = [cos(th3)      0     sin(th3)    0  ;
        sin(th3)      0    -cos(th3)    0  ;
          0           1         0       0  ;
          0           0         0       1  ]
      
H3_4 = [cos(th4)      0    -sin(th4)     0    ;
        sin(th4)      0     cos(th4)     0    ; 
          0          -1         0      l5+l6  ;
          0           0         0        1    ]

H4_5 = [ sin(th5)     0    -cos(th5)    0 ;
        -cos(th5)     0    -sin(th5)    0 ;
          0           1         0       0 ; 
          0           0         0       1 ]

H5_6 = [cos(th6)  -sin(th6)     0      0   ;
        sin(th6)   cos(th6)     0      0   ;
           0          0         1    l7+l8 ;
           0          0         0      1   ]
       

H0_6 = H0_1 * H1_2 * H2_3 * H3_4 * H4_5 * H5_6

nx = H0_6(1,1)
ox = H0_6(1,2)
ax=H0_6(1,3)
px=H0_6(1,4)
ny=H0_6(2,1)
oy=H0_6(2,2)
ay=H0_6(2,3)
py=H0_6(2,4)
nz=H0_6(3,1)
oz=H0_6(3,2)
az=H0_6(3,3)
pz=H0_6(3,4)
