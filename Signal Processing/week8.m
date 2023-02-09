%unipolar non return to zero

clc;

clear all;

close all;

M = dlmread('data1.txt');
len = length(M);

points = [];

for i=0:len-1
    points = [points [i;M(i+1)] [1+i;M(i+1)]];
end

plot(points(1,:),points(2,:)), axis([-1,10,-2,2]);
grid on;
