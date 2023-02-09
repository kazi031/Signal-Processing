%for k = [3 7 25 52 65]
 %   disp(k);
%end
a = 10 ;
switch a*2
    case 0
        disp('zero');
    case {2,4,6,8,20}
        disp('even');
    case {1,3,5,21}
        disp('odd');
    otherwise
        disp('nothing')
end


%z = eye(10);
%z = z + 20;
%save('kazi.mat','z');


