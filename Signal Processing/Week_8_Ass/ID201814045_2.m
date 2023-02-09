clc;
clear;
close all;

%Modulation
load('input.mat');
A=Input(1,:);
t=Input(2,:);
subplot (2,1,1);
plot(t,A);
title('Input Signal');
xlabel('Time');
ylabel('Ampliture');
axis([0 5*(10^-3) -5 5]);
grid on;




hold on
delta =0.1613;
x(1)=0;
x=[x 0 0 0 0 0 0 0];
len=length(A);

j=1;
d=[];
for i=9:8:len
    if i==497
        d=[d 0];
    end
    if A(i)>=A(i-8)
        d=[d 1];
        x(i)=x(i-1)+delta;
        for k=i+1:i+7
            x(k)=x(k-1);
        
        end
    else
        d=[d 0];
        x(i)=x(i-1)-delta;
        for k=i+1:i+7
            x(k)=x(k-1);
        
        end
        
        
        
    end
    
end

subplot (2,1,1);
plot(t,x,'r');
title('Staircase Signal');
xlabel('Time');
ylabel('Ampliture');
axis([0 5*(10^-3) -6 6]);
grid on;
hold off
Output=[d,x];
dlmwrite('output.txt',Output);


%Demodulation
o=load('output.txt');
x=o(1,126:1125);
d1=o(1,1:125);
load('input.mat');

t1=Input(2,:);
delta =0.1613;
A1=zeros(1,1000);
j=8;
for i=1:length(d1)
   if d1(i)==0
        A1(j+1)=A1(j)-delta;
        for k=j+2:j+9
            A1(k)=A1(k-1);
            j=j+1;
        end
    else
        
        A1(j+1)=A1(j)+delta;
        for k=j+2:j+9
            A1(k)=A1(k-1);
            j=j+1;
        end
        
        
   end   
       
end
%x=A(1,10:1009);
%plot(t,x,'b');
%hold on;
fs=200;
z= designfilt('lowpassfir','FilterOrder',50,'CutoffFrequency',1,'SampleRate',fs);
y1=filter(z,x);
subplot (2,1,2);
plot(y1);
title('Output Signal');
xlabel('Time');
ylabel('Ampliture');
axis([0 1000 -5 5]);
grid on;



