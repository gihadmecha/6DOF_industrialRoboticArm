
clear 
clc

values = {201.58, 0; 241.58, 40; 281.58, 80};
headers = {'x','y'};

xlswrite('try_2.xlsx',[headers; values]);

filename = 'try_2.xlsx';
A = xlsread(filename)

% filename = 'myExample.xlsx';
x = xlsread(filename,'A:A')
y = xlsread(filename,'B:B')

params = table(x, y)

stats = rowfun(@inverse_kinematics_v2,params,...
    'OutputVariableNames',...
    {'theta_1' 'theta_2' 'theta_3' 'theta_4' 'theta5' 'theta_6'})