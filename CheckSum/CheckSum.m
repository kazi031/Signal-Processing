clc;
clear all;
close all;
data = 'Forouzan'
%data = 'Kazi Rafid Raiyan'
%data = dlmread('CheckSum.txt');


%data_len = length(data)
%mmm = mod(data_len,4)
%add_korte_hobe = 4 - mmm
data = dec2hex(data)

%for n=1:1:add_korte_hobe
%  data = [data;'00'];
%end

data = reshape(data',[],4)
data = data'

%sender side

data_sender = [data; '0000']

sender_sum = dec2hex(sum(hex2dec(data_sender)))

len = length(sender_sum)

p_sum = sender_sum(len-3:len)
carry = sender_sum(1:len-4)

sender_sum = dec2hex(hex2dec(p_sum) + hex2dec(carry))

check_sum = dec2hex(hex2dec('FFFF') - hex2dec(sender_sum))

%receiver end



data_receiver = [data;'7038']

receiver_sum = dec2hex(sum(hex2dec(data_receiver)))

receiver_len = length(receiver_sum)
p_sum_receiver = receiver_sum(receiver_len-3:receiver_len)
carry_receiver = receiver_sum(1:receiver_len-4)

receiver_sum = dec2hex(hex2dec(p_sum_receiver) + hex2dec(carry_receiver))

check_sum_receiver =  dec2hex(hex2dec('FFFF') - hex2dec(receiver_sum))





