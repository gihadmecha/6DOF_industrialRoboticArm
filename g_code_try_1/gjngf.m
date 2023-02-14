clear 
clc
values = {1, 2; 3, 4; 5, 6};
headers = {'x','y'};
xlswrite('myExample.xlsx',[headers; values]);
filename = 'myExample.xlsx';
A = xlsread(filename)

filename = 'myExample.xlsx';
sheet = 1;
xlRange = 'B2:C3';
subsetA = xlsread(filename,sheet,xlRange)

filename = 'myExample.xlsx';
columnB = xlsread(filename,'B:B')
% 
% 
% 
