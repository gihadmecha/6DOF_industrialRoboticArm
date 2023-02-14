addpath C:\robot-10.2\rvctools
startup_rvc

 %given thetas
th1 = 0
th2 = 0
th3 = 0
th4 = 0
th5 = 0
th6 = 0

%lengths of links in cm
l1 = 10 
l2 = 30 
l3 = 40
l4 = 0
l5 = 0
l6 = 0


 %build 3_DOF manipulatior using DH_parameter table and object oriented
L1 = Link('d', l1, 'a', 0, 'alpha', pi/2)
L2 = Link('d', 0 , 'a', l2, 'alpha', 0, 'offset', pi/2)
L3 = Link('d', 0, 'a', 0, 'alpha', pi/2)
L4 = Link('d', l3+l4, 'a', 0, 'alpha', -pi/2)
L5 = Link('d', 0, 'a', 0, 'alpha', pi/2, 'offset', -pi/2)
L6 = Link('d', l5+l6, 'a', 0, 'alpha', 0)
bot = SerialLink([L1 L2 L3 L4 L5 L6], 'name', 'my robot')

 %forward kinematics simulations
T = bot.fkine([th1 th2 th3 th4 th5 th6])            %forward kinematics function from the Robotics toolbox get the desired positon& orientation

p = T.transl;                                       %forward kinematics function from the Robotics toolbox get the desired positon as a vector                                         
plot3(p(1),p(2),p(3), 'b.', 'MarkerSize', 5)        %standard plot function 
grid
hold on                                             %to overlap the next plot on this plot

%draw the cloud
Samples = 10000;%repeat the loop for 10000

for abc =0 : Samples
    %get randum thetas through the available motor movement range 
    q1 = [(0+360)*rand()-0]*pi/180;                          % 0 < q1 <360
    q2 = [(90+90)*rand()-90]*pi/180;                         % -90 < q1 <90
    q3 = [(0+180)*rand()-0]*pi/180;                          % 0 < q1 <180
    q4 = [(0+360)*rand()-0]*pi/180;                          % 0 < q2 <360
    q5 = [(0+180)*rand()-0]*pi/180;                          % 0 < q1 <180
    q6 = [(0+360)*rand()-0]*pi/180;                          % 0 < q3 <360
    
    qi = [q1 q2 q3 q4 q5 q6];
    
    bot.plot(qi);                                  %plot function                         
    T = bot.fkine(qi);                             %forward kinematics function from the Robotics toolbox get the desired positon& orientation
    
    p = T.transl;                                  %forward kinematics function from the Robotics toolbox get the desired positon as a vector
    plot3(p(1),p(2),p(3), 'b.', 'MarkerSize', 5)   %standard plot function

end

