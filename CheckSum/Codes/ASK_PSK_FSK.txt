clc;
clear all;
close all;

%x = [1 0 0 1 1 0 1] % Data
x = dlmread('digital_data.txt');

%disp(x)

% er por digital data ke digital signal e convert korbo
% ekhane time er bepar ta ashbe
% bit period define korte hobe
% we assume a bit period to be 1 micro second

bp = 0.000001;

% now data signal produce korte hobe
% digital data te 1 er jonno kichu point nibo and 0 er jonno kichu point
% nibo ei koyta point nibo eta producer er upor depend kore amra 100 ta
% point nibo

bit = [] ; %empty array
len = length(x);

for n=1:1:len
  if x(n) == 1
      %1 bit er jonno onekgula 1 generate korbo
     signal_element = ones(1,100);
  else
     % 0 bit er jonno onekgula 0 produce korbo 
     signal_element = zeros(1,100);
  end
  
  %bit er shathe include kore dibo
  
  bit = [bit signal_element];
end

%time scale produce korbo
% t1 arr ta shuru hobe bp/100 theke
% time1 er increament o hobe bp/100
% 100 ta point bole 100 diye bhaag kora hocche
% len*bp cause prottek ta bit bp time exist korbe
time1 = bp/100:bp/100:len*bp;

% ekhane array generate hocche

subplot(4,1,1);
plot(time1,bit,'LineWidth',2.5);
grid on;
% axis e bolbo x axix kotha theke shuru hobe kothay shesh hobe and y axis
% kotha theke shuru hobe kothay shesh hobe
axis([0 len*bp -0.5 1.5]);
xlabel('Time');
ylabel('Amplitude');
title('Input Digital Signal');


%                             modulated signal

%                            ASK

% here 

% y'(t)= A1 sin(2*pi*f*t + del) when v = 0
% y'(t) = A2 sin(2*pi*f*t + del) when v = 1

% A1 = 0
% A2 = 10 micro volt

% F = 1/T
% here T is bit period bp
% erokom hole ekta bit er jonno ekta full length signal generate hobe
% er theke beshi korte chaile F ke multiply korte hobe
% suppose F' = 10 * F ;
% del = 90 dhorle sin ta cos hoye jabe

A1 = 0;
A2 = 1;

f = 10* 1/bp;

%ekhane arekta time er array generate korte hobe

time2 = bp/99:bp/99:bp;

% analog er jonno time ta shrink korbe

ask_bit = [];

for n=1:1:len
  if x(n) == 1
     y = A2*cos(2*3.14*f*time2);
  else
     y = A1*cos(2*3.14*f*time2);
  end
  
  %bit er shathe include kore dibo
  
  ask_bit = [ask_bit y];
end

time3 = bp/99:bp/99:bp*len;

subplot(4,1,2);
plot(time3,ask_bit,'LineWidth',.5);
grid on;
% axis e bolbo x axix kotha theke shuru hobe kothay shesh hobe and y axis
% kotha theke shuru hobe kothay shesh hobe
axis([0 len*bp -1.5 1.5]);
xlabel('Time');
ylabel('Amplitude');
title('ASK Signal');



 %                                                       fsk
 
 

%A1 = 0;
A = 1;

f1 = 10* 1/bp;
f2 = 1* 1/bp;


time4 = bp/99:bp/99:bp;

fsk_bit = [];

for n=1:1:len
  if x(n) == 1
     y1 = A*cos(2*3.14*f1*time4);
  else
     y1 = A*cos(2*3.14*f2*time4);
  end
  
  %bit er shathe include kore dibo
  
  fsk_bit = [fsk_bit y1];
end

time5 = bp/99:bp/99:bp*len;

subplot(4,1,3);
plot(time5,fsk_bit,'LineWidth',.5);
grid on;
% axis e bolbo x axix kotha theke shuru hobe kothay shesh hobe and y axis
% kotha theke shuru hobe kothay shesh hobe
axis([0 len*bp -1.5 1.5]);
xlabel('Time');
ylabel('Amplitude');
title('FSK Signal');



%  --------------------------------------------------------------------------psk---------------------------------------------------------------------------------


A = 1;

f = 1* 1/bp;



time6 = bp/99:bp/99:bp;

psk_bit = [];

for n=1:1:len
  if x(n) == 1
     y2 = A*sin(2*3.14*f*time6);
  else
     y2 = -A*sin(2*3.14*f*time6);
  end
  
  %bit er shathe include kore dibo
  
  psk_bit = [psk_bit y2];
end

time7 = bp/99:bp/99:bp*len;

subplot(4,1,4);
plot(time7,psk_bit,'LineWidth',.5);
grid on;
% axis e bolbo x axix kotha theke shuru hobe kothay shesh hobe and y axis
% kotha theke shuru hobe kothay shesh hobe
axis([0 len*bp -1.5 1.5]);
xlabel('Time');
ylabel('Amplitude');
title('PSK Signal');



