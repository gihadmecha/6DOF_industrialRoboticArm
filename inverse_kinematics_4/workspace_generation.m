clear
clc

%peter corke Robotics toolbox path
addpath C:\robot-10.2\rvctools
startup_rvc

 %given thetas
th1 = 0   
th2 = 0
th3 = 0  
th4 = 0
th5 = 0
th6 = 0

 %lengths of links in mm
l1 = 215.5;   %35; 
l2 = 19.58;   %20.46; 
l3 = 173;
l4 = 195;
l5 = 182;
l6 = 120.27;
l7 = 62;
l8 = 61;

 %build 6_DOF manipulatior using DH_parameter table and object oriented
L1 = Link('d', l1+l3, 'a', l2, 'alpha', pi/2)
L2 = Link('d', 0 , 'a', l4, 'alpha', 0, 'offset', pi/2)
L3 = Link('d', 0, 'a', 0, 'alpha', -pi/2, 'offset', pi)
L4 = Link('d', l5+l6, 'a', 0, 'alpha', -pi/2, 'offset', pi)
L5 = Link('d', 0, 'a', 0, 'alpha', -pi/2, 'offset', pi/2)
L6 = Link('d', l7+l8, 'a', 0, 'alpha', 0)
bot = SerialLink([L1 L2 L3 L4 L5 L6], 'name', 'my robot')

  
 %forward kinematics simulations
T = bot.fkine([th1 th2 th3 th4 th5 th6])            %forward kinematics function from the Robotics toolbox get the desired positon & orientation

p = T.transl;                                       %forward kinematics function from the Robotics toolbox get the desired positon as a vector                                         
plot3(p(1),p(2),p(3), 'b.', 'MarkerSize', 5)        %standard plot function 
hold on                                             %to overlap the next plot on this plot

%draw the cloud
Samples = 10000;                                    %repeat the loop for 10000
for abc =0 : Samples
    %get randum thetas through the available motor movement range 
    q1 = [(180+180)*rand()-180]*pi/180;                          % -180 < q1 <180
    q2 = [(108+45)*rand()-108]*pi/180;                         % -108 < q2 <45
    q3 = [(15+194)*rand()-15]*pi/180;                          % -15 < q3 <194
    q4 = [(180+180)*rand()-180]*pi/180;                          % -180 < q4 <180
    q5 = [(19+148)*rand()-19]*pi/180;                          % -19 < q5 <148
    q6 = [(180+180)*rand()-180]*pi/180;                          % -180 < q6 <180
    
    qi = [q1 q2 q3 q4 q5 q6];
    
    bot.plot(qi);                                  %plot function                         
    T = bot.fkine(qi);                             %forward kinematics function from the Robotics toolbox get the desired positon& orientation
    
    p = T.transl;                                  %forward kinematics function from the Robotics toolbox get the desired positon as a vector
    plot3(p(1),p(2),p(3), 'b.', 'MarkerSize', 5)   %standard plot function
end

