
function F = our_robot(th)


    

F = [ 
sin(th(6))*(cos(th(4))*sin(th(1)) + sin(th(4))*(cos(th(1))*sin(th(2))*sin(th(3)) - cos(th(1))*cos(th(2))*cos(th(3)))) + cos(th(6))*(sin(th(5))*(sin(th(1))*sin(th(4)) - cos(th(4))*(cos(th(1))*sin(th(2))*sin(th(3)) - cos(th(1))*cos(th(2))*cos(th(3)))) + cos(th(5))*(cos(th(1))*cos(th(2))*sin(th(3)) + cos(th(1))*cos(th(3))*sin(th(2))))-nx;
 
 

 
cos(th(6))*(cos(th(4))*sin(th(1)) + sin(th(4))*(cos(th(1))*sin(th(2))*sin(th(3)) - cos(th(1))*cos(th(2))*cos(th(3)))) - sin(th(6))*(sin(th(5))*(sin(th(1))*sin(th(4)) - cos(th(4))*(cos(th(1))*sin(th(2))*sin(th(3)) - cos(th(1))*cos(th(2))*cos(th(3)))) + cos(th(5))*(cos(th(1))*cos(th(2))*sin(th(3)) + cos(th(1))*cos(th(3))*sin(th(2))))-ox;
 
 

 
sin(th(5))*(cos(th(1))*cos(th(2))*sin(th(3)) + cos(th(1))*cos(th(3))*sin(th(2))) - cos(th(5))*(sin(th(1))*sin(th(4)) - cos(th(4))*(cos(th(1))*sin(th(2))*sin(th(3)) - cos(th(1))*cos(th(2))*cos(th(3))))-ax;
 
 

 
10*cos(th(1)) + 190*cos(th(1))*cos(th(2)) - 131*cos(th(5))*(sin(th(1))*sin(th(4)) - cos(th(4))*(cos(th(1))*sin(th(2))*sin(th(3)) - cos(th(1))*cos(th(2))*cos(th(3)))) + 131*sin(th(5))*(cos(th(1))*cos(th(2))*sin(th(3)) + cos(th(1))*cos(th(3))*sin(th(2))) + (30047*cos(th(1))*cos(th(2))*sin(th(3)))/100 + (30047*cos(th(1))*cos(th(3))*sin(th(2)))/100-px;
 
 

 
- sin(th(6))*(cos(th(1))*cos(th(4)) - sin(th(4))*(sin(th(1))*sin(th(2))*sin(th(3)) - cos(th(2))*cos(th(3))*sin(th(1)))) - cos(th(6))*(sin(th(5))*(cos(th(1))*sin(th(4)) + cos(th(4))*(sin(th(1))*sin(th(2))*sin(th(3)) - cos(th(2))*cos(th(3))*sin(th(1)))) - cos(th(5))*(cos(th(2))*sin(th(1))*sin(th(3)) + cos(th(3))*sin(th(1))*sin(th(2))))-ny;
 
 

 
sin(th(6))*(sin(th(5))*(cos(th(1))*sin(th(4)) + cos(th(4))*(sin(th(1))*sin(th(2))*sin(th(3)) - cos(th(2))*cos(th(3))*sin(th(1)))) - cos(th(5))*(cos(th(2))*sin(th(1))*sin(th(3)) + cos(th(3))*sin(th(1))*sin(th(2)))) - cos(th(6))*(cos(th(1))*cos(th(4)) - sin(th(4))*(sin(th(1))*sin(th(2))*sin(th(3)) - cos(th(2))*cos(th(3))*sin(th(1))))-oy;
 
 

 
cos(th(5))*(cos(th(1))*sin(th(4)) + cos(th(4))*(sin(th(1))*sin(th(2))*sin(th(3)) - cos(th(2))*cos(th(3))*sin(th(1)))) + sin(th(5))*(cos(th(2))*sin(th(1))*sin(th(3)) + cos(th(3))*sin(th(1))*sin(th(2)))-ay;
 
 

 
10*sin(th(1)) + 190*cos(th(2))*sin(th(1)) + 131*cos(th(5))*(cos(th(1))*sin(th(4)) + cos(th(4))*(sin(th(1))*sin(th(2))*sin(th(3)) - cos(th(2))*cos(th(3))*sin(th(1)))) + 131*sin(th(5))*(cos(th(2))*sin(th(1))*sin(th(3)) + cos(th(3))*sin(th(1))*sin(th(2))) + (30047*cos(th(2))*sin(th(1))*sin(th(3)))/100 + (30047*cos(th(3))*sin(th(1))*sin(th(2)))/100-py;
 
 

 
- cos(th(6))*(cos(th(5))*(cos(th(2))*cos(th(3)) - sin(th(2))*sin(th(3))) - cos(th(4))*sin(th(5))*(cos(th(2))*sin(th(3)) + cos(th(3))*sin(th(2)))) - sin(th(4))*sin(th(6))*(cos(th(2))*sin(th(3)) + cos(th(3))*sin(th(2)))-nz;
 
 

 
sin(th(6))*(cos(th(5))*(cos(th(2))*cos(th(3)) - sin(th(2))*sin(th(3))) - cos(th(4))*sin(th(5))*(cos(th(2))*sin(th(3)) + cos(th(3))*sin(th(2)))) - cos(th(6))*sin(th(4))*(cos(th(2))*sin(th(3)) + cos(th(3))*sin(th(2)))-oz;
 
 

 
- sin(th(5))*(cos(th(2))*cos(th(3)) - sin(th(2))*sin(th(3))) - cos(th(4))*cos(th(5))*(cos(th(2))*sin(th(3)) + cos(th(3))*sin(th(2)))-az;
 
 

 
190*sin(th(2)) - (30047*cos(th(2))*cos(th(3)))/100 + (30047*sin(th(2))*sin(th(3)))/100 - 131*sin(th(5))*(cos(th(2))*cos(th(3)) - sin(th(2))*sin(th(3))) - 131*cos(th(4))*cos(th(5))*(cos(th(2))*sin(th(3)) + cos(th(3))*sin(th(2))) + 165-pz;
 

];
    end
end
