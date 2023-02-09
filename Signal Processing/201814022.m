clc;

clear all;

close all;

M = dlmread('polarrz.txt');
len = length(M);

points = [];

count = 0;

for i=0:len-1
    if(i==0)
        if(M(i+1)==0)
            points = [points [i;1] [i+1;1]];
            count = count + 2;
        else
            points = [points [i;-1] [i+1;-1]];   
            count = count + 2;
        end
    else
        if(M(i+1)==0)
            if(points(2,count)== 1)
                points = [points [i;1] [i+1;1]]
                count = count + 2;
            else
                points = [points [i;-1] [i+1;-1]]
                count = count + 2;
            end
        else
            if(points(2,count)== 1)
                points = [points [i;-1] [i+1;-1]]
                count = count + 2;
            else
                points = [points [i;1] [i+1;1]]
                count = count + 2;
            end
        end
    end
end

plot(points(1,:),points(2,:)), axis([0,len,-2,2]);
grid on;
