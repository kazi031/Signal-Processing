clc;
clear all;
load('input.mat');
%input length
len = size(Input,2);
%inp amplitude
a = Input(1,:);
%inp time
t = Input(2,:);
%showing the input data

xlabel('Time');
ylabel('Ampliture');

subplot(2,1,1);
plot(t,a);
grid on;

%modulation


staircases = zeros(1,len);
bin = zeros(1,len);
bin(1) = 1;
del=0.02;
staircases(1) = 0;
for i=1:len-1
    if(a(i) < a(i+1))
        bin(i) = 1;
        staircases(i+1) = staircases(i)+del;
    else
        bin(i) = 0;
        staircases(i+1) = staircases(i)-del;
    end
end


fid = fopen('output.txt','wt');
fprintf(fid,'%d' ,bin);
fclose(fid);

%plotting output
title('Staircase Signal');
xlabel('Time');
ylabel('Ampliture');

subplot(2,1,2);
plot(t,a);
hold on;
grid on;
stairs(t,staircases);