
clc;

clear all;

close all;


M = dlmread('work1.txt');
len =length(M);
points=[];
for i=1:len-2
    if(M(i)==0)
        if(M(i+1) == 0 && M(i+2)==0)
            points = [points [i;1] [i+0.5;1]];
            points = [points [i+0.5;0] [i+1;0]];
        elseif(M(i+1) == 0 && M(i+2)==1)
            points = [points [i;-1] [i+.5;-1]];
            points = [points [i+.5;0] [i+1;0]];
        elseif(M(i+1) == 1 && M(i+2)==0)
            points = [points [i;0] [i+0.5;0]];
            points = [points [i+0.5;-1] [i+1;-1]];
        else
            points = [points [i;0] [i+0.5;0]];
            points = [points [i+0.5;0] [i+1;-0]];
        end
    else
        if(M(i+1) == 0 && M(i+2)==0)
            points = [points [i;-1] [i+0.5;-1]];
        points = [points [i+0.5;1] [i+1;1]];
        elseif(M(i+1) == 0 && M(i+2)==1)
            points = [points [i;-1] [i+0.5;-1]];
         points = [points [i+0.5;1] [i+1;1]];
        elseif(M(i+1) == 1 && M(i+2)==0)
            points = [points [i;0] [i+0.5;0]];
        points = [points [i+0.5;1] [i+1;1]];
        else
            points = [points [i;0] [i+0.5;0]];
        points = [points [i+0.5;0] [i+1;-0]];
        end
    end
end

plot(points(1,:),points(2,:)),axis([0,len,-2,2])
grid on