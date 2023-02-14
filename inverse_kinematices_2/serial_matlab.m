

function y=serial_matlab(u)
%insure serial not busy
delete(instrfind({'Port'},{'COM4'}));
s=serial('COM4','BAUD', 9600);
                            
fopen(s);
pause(2);

y(1)=u(1);
y(2)=u(2);
y(3)=u(3);
y(4)=u(4);
y(5)=u(5);
y(6)=u(6); 



 %fprintf(s, '%d %d %d %d %d %d \n', [y(1),y(2),y(3),y(4),y(5),y(6)]);
 fprintf(s,'%f %f\n', [y(1),y(2),y(3),y(4),y(5),y(6)]);
 fclose(s);
clear s; %Remove the variable
end

