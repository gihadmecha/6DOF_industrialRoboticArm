% % in mm
% u(1) == x_initial
% u(2) == y_initial
% u(3) == z_initial
% %in degree
% u(4) == alpha_initial
% u(5) == beta_initial
% u(6) == gamma_initial
% 
% % in mm
% u(7) == x_final
% u(8) == y_final
% u(9) == z_final
% %in degree
% u(10) == alpha_final
% u(11) == beta_final
% u(12) == gamma_final
% u(13) == required_velocity

function [y1,y2] = generate_trapazoidal_speed_curve(u)
i = 1;

% % in mm
% x_initial=258.8485;
% y_initial=-150;
% z_initial=650;
% %in degree
% alpha_initial=-53.9891093531661;
% beta_initial=106.99310099067357;
% gamma_initial=18.51038314678336;
% 
% % in mm
% x_final=258.8485;
% y_final=-150;
% z_final=822.943;
% %in degree
% alpha_final=-53.9891093531661;
% beta_final=106.99310099067357;
% gamma_final=18.51038314678336;

% in mm
x_initial=u(1);
y_initial=u(2);
z_initial=u(3);
%in degree
alpha_initial=u(4);
beta_initial=u(5);
gamma_initial=u(6);

% in mm
x_final=u(7);
y_final=u(8);
z_final=u(9);
%in degree
alpha_final=u(10);
beta_final=u(11);
gamma_final=u(12);

%user_specification
% required_velocity = 100;
required_velocity = u(13);
required_distance = sqrt((x_final-x_initial)^2+(y_final-y_initial)^2+(z_final-z_initial)^2);
T = required_distance / required_velocity ;                  %the total time



% in mm
initial_position=[x_initial,y_initial,z_initial,alpha_initial,beta_initial,gamma_initial];
final_position=[x_final,y_final,z_final,alpha_final,beta_final,gamma_final];

%in degrees
q_initial=inverse_kinematics_v2(initial_position);
q_final=inverse_kinematics_v2(final_position);


%motors_specification
if(q_initial(1)<q_final(1))
    max_acceleration_1 = 360*2000/1000;
else
    max_acceleration_1 = - 360*2000/1000;
end

if(q_initial(2)<q_final(2))
    max_acceleration_2 = 360*800/1000;
else
    max_acceleration_2 = - 360*800/1000;
end

if(q_initial(3)<q_final(3))
    max_acceleration_3 = 360*1400/1000;
else
    max_acceleration_3 = - 360*1400/1000;
end

if(q_initial(4)<q_final(4))
    max_acceleration_4 = 360*1500/800;
else
    max_acceleration_4 = - 360*1500/800;
end

if(q_initial(5)<q_final(5))
    max_acceleration_5 = 360*1000/800;
else
    max_acceleration_5 = - 360*1000/800;
end

if(q_initial(6)<q_final(6))
    max_acceleration_6 = 360*2200/800;
else
    max_acceleration_6 = - 360*2200/800;
end

%get the greatest ta
 eqn_1 = [max_acceleration_1   -T*max_acceleration_1    q_final(1)-q_initial(1)];
 ta(:,1) = roots(eqn_1);
 
 eqn_2 = [max_acceleration_2   -T*max_acceleration_2   q_final(2)-q_initial(2)];
 ta(:,2) = roots(eqn_2);
 
 eqn_3 = [max_acceleration_3   -T*max_acceleration_3    q_final(3)-q_initial(3)];
 ta(:,3) = roots(eqn_3);
 
 eqn_4 = [max_acceleration_4   -T*max_acceleration_4    q_final(4)-q_initial(4)];
 ta(:,4) = roots(eqn_4);
 
 eqn_5 = [max_acceleration_5   -T*max_acceleration_5    q_final(5)-q_initial(5)];
 ta(:,5) = roots(eqn_5);
 
 eqn_6 = [max_acceleration_6   -T*max_acceleration_6    q_final(6)-q_initial(6)];
 ta(:,6) = roots(eqn_6);
 
 
 ta;
 M = max(ta,[],2);
 required_ta = M(2);


 % interation = T/500 ;
 interation = required_ta/26;


%get acceleration_1
acceleration_1 = (q_initial(1)-q_final(1))/((required_ta)^2-(required_ta)*T);

%get acceleration_2
acceleration_2 = (q_initial(2)-q_final(2))/((required_ta)^2-(required_ta)*T);

%get acceleration_3
acceleration_3 = (q_initial(3)-q_final(3))/((required_ta)^2-(required_ta)*T);

%get acceleration_4
acceleration_4 = (q_initial(4)-q_final(4))/((required_ta)^2-(required_ta)*T);

%get acceleration_5
acceleration_5 = (q_initial(5)-q_final(5))/((required_ta)^2-(required_ta)*T);

%get acceleration_6
acceleration_6 = (q_initial(6)-q_final(6))/((required_ta)^2-(required_ta)*T);


for t=0:interation:required_ta
    
 velocity(i,1) = acceleration_1 * t;
 theta(i,1) = q_initial(1) + .5 * acceleration_1 * t^2;
  
 velocity(i,2) = acceleration_2 * t;
 theta(i,2) = q_initial(2) + .5 * acceleration_2 * t^2;
 
 velocity(i,3) = acceleration_3 * t;
 theta(i,3) = q_initial(3) + .5 * acceleration_3 * t^2;
 
 velocity(i,4) = acceleration_4 * t;
 theta(i,4) = q_initial(4) + .5 * acceleration_4 * t^2;
 
 velocity(i,5) = acceleration_5 * t;
 theta(i,5) = q_initial(5) + .5 * acceleration_5 * t^2;
 
 velocity(i,6) = acceleration_6 * t;
 theta(i,6) = q_initial(6) + .5 * acceleration_6 * t^2;
 
% theta(i,7) = t;
% velocity(i,7) = t;
%  theta(i,8)= i; 
%  velocity(i,8)= i; 
 i=i+1;
 end

tu = T-2*required_ta;

for t=0:interation:tu
 velocity(i,1) = acceleration_1 * required_ta;
 theta(i,1) = q_initial(1) + .5 * acceleration_1 * required_ta^2 + acceleration_1 * required_ta *t ;
  
 velocity(i,2) = acceleration_2 * required_ta;
 theta(i,2) = q_initial(2) + .5 * acceleration_2 * required_ta^2 + acceleration_2 * required_ta *t;
 
 velocity(i,3) = acceleration_3 * required_ta;
 theta(i,3) = q_initial(3) + .5 * acceleration_3 * required_ta^2 + acceleration_3 * required_ta *t;
 
 velocity(i,4) = acceleration_4 * required_ta;
 theta(i,4) = q_initial(4) + .5 * acceleration_4 * required_ta^2 + acceleration_4 * required_ta *t;
 
 velocity(i,5) = acceleration_5 * required_ta;
 theta(i,5) = q_initial(5) + .5 * acceleration_5 * required_ta^2 + acceleration_5 * required_ta *t;
 
 velocity(i,6) = acceleration_6 * required_ta;
 theta(i,6) = q_initial(6) + .5 * acceleration_6 * required_ta^2 + acceleration_6 * required_ta *t;
 
%  theta(i,7) = t;
%  velocity(i,7) = t;
%  theta(i,8)= i; 
%  velocity(i,8)= i;
 i=i+1;
end

for t=0:interation:required_ta
 velocity(i,1) = acceleration_1 * required_ta - acceleration_1 * t ;
 theta(i,1) = q_initial(1) + .5 * acceleration_1 * required_ta^2 + acceleration_1 * required_ta *tu + acceleration_1 * required_ta * t - .5 * acceleration_1 * t^2;
  
 velocity(i,2) = acceleration_2 * required_ta - acceleration_2 * t ;
 theta(i,2) = q_initial(2) + .5 * acceleration_2 * required_ta^2 + acceleration_2 * required_ta *tu + acceleration_2 * required_ta * t - .5 * acceleration_2 * t^2;
 
 velocity(i,3) = acceleration_3 * required_ta - acceleration_3 * t ;
 theta(i,3) = q_initial(3) + .5 * acceleration_3 * required_ta^2 + acceleration_3 * required_ta *tu + acceleration_3 * required_ta * t - .5 * acceleration_3 * t^2;
 
 velocity(i,4) = acceleration_4 * required_ta - acceleration_4 * t ;
 theta(i,4) = q_initial(4) + .5 * acceleration_4 * required_ta^2 + acceleration_4 * required_ta *tu + acceleration_4 * required_ta * t - .5 * acceleration_4 * t^2;
 
 velocity(i,5) = acceleration_5 * required_ta - acceleration_5 * t ;
 theta(i,5) = q_initial(5) + .5 * acceleration_5 * required_ta^2 + acceleration_5 * required_ta *tu + acceleration_5 * required_ta * t - .5 * acceleration_5 * t^2;
 
 velocity(i,6) = acceleration_6 * required_ta - acceleration_6 * t ;
 theta(i,6) = q_initial(6) + .5 * acceleration_6 * required_ta^2 + acceleration_6 * required_ta *tu + acceleration_6 * required_ta * t - .5 * acceleration_6 * t^2;
 
%  theta(i,7) = t;
%  velocity(i,7) = t;
%  theta(i,8)= i; 
%  velocity(i,8)= i;
 i=i+1;
end

y1 = theta;
y2 = velocity;
end

