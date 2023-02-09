clear all;
clc;
t = linspace(0,1,100);
fm = 5;
y = sin(2*pi*fm*t);
subplot(3,2,3);
plot(t,y);

fc = 100;
y2 = sin(2*pi*fc*t);
subplot(3,2,4);
plot(t,y2);
