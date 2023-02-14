function F = our_robot(th)



            H_desired(1,1)=0 ;H_desired(1,2)= 0 ;H_desired(1,3)=-1 ;H_desired(1,4)=100 ;
            H_desired(2,1)=0 ;H_desired(2,2)=-1 ;H_desired(2,3)=0 ;H_desired(2,4)=0;
            H_desired(3,1)=-1 ;H_desired(3,2)= 0 ;H_desired(3,3)=0 ;H_desired(3,4)=400 ;
            H_desired(4,1)=0 ;H_desired(4,2)= 0 ;H_desired(4,3)= 0 ;H_desired(4,4)=1 ;
H_desired        

F = [ 
sin(th(6))*(cos(th(4))*sin(th(1)) + sin(th(4))*(cos(th(1))*sin(th(2))*sin(th(3)) - cos(th(1))*cos(th(2))*cos(th(3)))) + cos(th(6))*(sin(th(5))*(sin(th(1))*sin(th(4)) - cos(th(4))*(cos(th(1))*sin(th(2))*sin(th(3)) - cos(th(1))*cos(th(2))*cos(th(3)))) + cos(th(5))*(cos(th(1))*cos(th(2))*sin(th(3)) + cos(th(1))*cos(th(3))*sin(th(2))))-H_desired(1,1);
 
 

 
cos(th(6))*(cos(th(4))*sin(th(1)) + sin(th(4))*(cos(th(1))*sin(th(2))*sin(th(3)) - cos(th(1))*cos(th(2))*cos(th(3)))) - sin(th(6))*(sin(th(5))*(sin(th(1))*sin(th(4)) - cos(th(4))*(cos(th(1))*sin(th(2))*sin(th(3)) - cos(th(1))*cos(th(2))*cos(th(3)))) + cos(th(5))*(cos(th(1))*cos(th(2))*sin(th(3)) + cos(th(1))*cos(th(3))*sin(th(2))))-H_desired(1,2);
 
 

 
sin(th(5))*(cos(th(1))*cos(th(2))*sin(th(3)) + cos(th(1))*cos(th(3))*sin(th(2))) - cos(th(5))*(sin(th(1))*sin(th(4)) - cos(th(4))*(cos(th(1))*sin(th(2))*sin(th(3)) - cos(th(1))*cos(th(2))*cos(th(3))))-H_desired(1,3);
 
 

 
10*cos(th(1)) + 190*cos(th(1))*cos(th(2)) - 131*cos(th(5))*(sin(th(1))*sin(th(4)) - cos(th(4))*(cos(th(1))*sin(th(2))*sin(th(3)) - cos(th(1))*cos(th(2))*cos(th(3)))) + 131*sin(th(5))*(cos(th(1))*cos(th(2))*sin(th(3)) + cos(th(1))*cos(th(3))*sin(th(2))) + (30047*cos(th(1))*cos(th(2))*sin(th(3)))/100 + (30047*cos(th(1))*cos(th(3))*sin(th(2)))/100-H_desired(1,4);
 
 

 
- sin(th(6))*(cos(th(1))*cos(th(4)) - sin(th(4))*(sin(th(1))*sin(th(2))*sin(th(3)) - cos(th(2))*cos(th(3))*sin(th(1)))) - cos(th(6))*(sin(th(5))*(cos(th(1))*sin(th(4)) + cos(th(4))*(sin(th(1))*sin(th(2))*sin(th(3)) - cos(th(2))*cos(th(3))*sin(th(1)))) - cos(th(5))*(cos(th(2))*sin(th(1))*sin(th(3)) + cos(th(3))*sin(th(1))*sin(th(2))))-H_desired(2,1);
 
 

 
sin(th(6))*(sin(th(5))*(cos(th(1))*sin(th(4)) + cos(th(4))*(sin(th(1))*sin(th(2))*sin(th(3)) - cos(th(2))*cos(th(3))*sin(th(1)))) - cos(th(5))*(cos(th(2))*sin(th(1))*sin(th(3)) + cos(th(3))*sin(th(1))*sin(th(2)))) - cos(th(6))*(cos(th(1))*cos(th(4)) - sin(th(4))*(sin(th(1))*sin(th(2))*sin(th(3)) - cos(th(2))*cos(th(3))*sin(th(1))))-H_desired(2,2);
 
 

 
cos(th(5))*(cos(th(1))*sin(th(4)) + cos(th(4))*(sin(th(1))*sin(th(2))*sin(th(3)) - cos(th(2))*cos(th(3))*sin(th(1)))) + sin(th(5))*(cos(th(2))*sin(th(1))*sin(th(3)) + cos(th(3))*sin(th(1))*sin(th(2)))-H_desired(2,3);
 
 

 
10*sin(th(1)) + 190*cos(th(2))*sin(th(1)) + 131*cos(th(5))*(cos(th(1))*sin(th(4)) + cos(th(4))*(sin(th(1))*sin(th(2))*sin(th(3)) - cos(th(2))*cos(th(3))*sin(th(1)))) + 131*sin(th(5))*(cos(th(2))*sin(th(1))*sin(th(3)) + cos(th(3))*sin(th(1))*sin(th(2))) + (30047*cos(th(2))*sin(th(1))*sin(th(3)))/100 + (30047*cos(th(3))*sin(th(1))*sin(th(2)))/100-H_desired(2,4);
 
 

 
- cos(th(6))*(cos(th(5))*(cos(th(2))*cos(th(3)) - sin(th(2))*sin(th(3))) - cos(th(4))*sin(th(5))*(cos(th(2))*sin(th(3)) + cos(th(3))*sin(th(2)))) - sin(th(4))*sin(th(6))*(cos(th(2))*sin(th(3)) + cos(th(3))*sin(th(2)))-H_desired(3,1);
 
 

 
sin(th(6))*(cos(th(5))*(cos(th(2))*cos(th(3)) - sin(th(2))*sin(th(3))) - cos(th(4))*sin(th(5))*(cos(th(2))*sin(th(3)) + cos(th(3))*sin(th(2)))) - cos(th(6))*sin(th(4))*(cos(th(2))*sin(th(3)) + cos(th(3))*sin(th(2)))-H_desired(3,2);
 
 

 
- sin(th(5))*(cos(th(2))*cos(th(3)) - sin(th(2))*sin(th(3))) - cos(th(4))*cos(th(5))*(cos(th(2))*sin(th(3)) + cos(th(3))*sin(th(2)))-H_desired(3,3);
 
 

 
190*sin(th(2)) - (30047*cos(th(2))*cos(th(3)))/100 + (30047*sin(th(2))*sin(th(3)))/100 - 131*sin(th(5))*(cos(th(2))*cos(th(3)) - sin(th(2))*sin(th(3))) - 131*cos(th(4))*cos(th(5))*(cos(th(2))*sin(th(3)) + cos(th(3))*sin(th(2))) + 165-H_desired(3,4);
 

];
end