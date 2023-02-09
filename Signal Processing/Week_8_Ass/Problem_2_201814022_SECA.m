clc;
clear all;
load('input.mat');

len = size(Input,2);

a = Input(1,:);
time = Input(2,:);

subplot(2,1,1);
plot(time,a);
grid on;
hold off;

staircases = zeros(1,len);
b = zeros(1,len);
b(1) = 1;
del=0.02;
staircases(1) = 0;
for i=1:len-1
    if(a(i) < a(i+1))
        b(i) = 1;
        staircases(i+1) = staircases(i)+del;
    else
        b(i) = 0;
        staircases(i+1) = staircases(i)-del;
    end
end

dlmwrite('output.txt',b,' ');

subplot(2,1,2);
plot(time,a);
hold on;
grid on;

stairs(time,staircases);
hold off;