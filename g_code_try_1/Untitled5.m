A = rand(5);
xlswrite('myExample.xlsx',A,'MyData')

trim = xlsread('myExample.xlsx','MyData','','',@setMinMax)