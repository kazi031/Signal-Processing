
clc;

clear all;

close all;

M = dlmread('data.txt');
len = length(M);

points = [];

count = 0;

for i=0:len-1
  if(i<=len-3)
    if(M(i+1)==0) 
       if(M(i+2)==0)
          if(M(i+3)==0)
             points = [points [i;1] [i+.5;1] [i+.5;0] [i+1;0]];
             count = count + 4;
          else
             points = [points [i;-1] [i+.5;-1] [i+.5;0] [i+1;0]]; 
             count = count + 4;
          end
       else
           if(M(i+3)==0)
                points = [points [i;0] [i+.5;0] [i+.5;-1] [i+1;-1]]; 
                count = count + 4;
           else
               if(i==0)
                points = [points [i;0] [i+.5;0] [i+.5;0] [i+1;0]];
                count = count + 4;
               else
                points = [points [i;points(2,count)] [i+.5;points(2,count)] [i+.5;points(2,count)] [i+1;points(2,count)]];
                count = count + 4;
               end
           end
       end
    else
       if(M(i+2)==0)
           if(M(i+3)==0)
               points = [points [i;-1] [i+.5;-1] [i+.5;1] [i+1;1]];
               count = count + 4;
           else
               points = [points [i;-1] [i+.5;-1] [i+.5;1] [i+1;1]];
               count = count + 4;
           end 
       else
           if(M(i+3)==0)
               points = [points [i;0] [i+.5;0] [i+.5;1] [i+1;1]];
               count = count + 4;
           else
               if(i==0)
                    points = [points [i;0] [i+.5;0] [i+.5;0] [i+1;0]];
                    count = count + 4;
               else
                    points = [points [i;points(2,count)] [i+.5;points(2,count)] [i+.5;points(2,count)] [i+1;points(2,count)]];
                    count = count + 4;
               end
           end
       end
    end
  else
      points = [points [i;points(2,count)] [i+.5;points(2,count)] [i+.5;points(2,count)] [i+1;points(2,count)]];
      count = count + 4;
  end
end
points
plot(points(1,:),points(2,:)), axis([0,len,-2,2]);
grid on;
