%unipolar non return to zero

clc;

clear all;

close all;

M = dlmread('polarrz.txt');
len = length(M);

points = [];

for i=0:len-1
    if(M(i+1) == 0)
        points = [points [i;-1] [i+.5;-1] [i+.5;0] [i+1;0]]
    else
        points = [points [i;1] [i+.5;1] [i+.5;0] [i+1;0]]
    end
end
points;
plot(points(1,:),points(2,:)), axis([0,len,-2,2]);
grid on;
