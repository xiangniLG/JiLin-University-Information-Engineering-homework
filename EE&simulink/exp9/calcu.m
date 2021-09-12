function  [max1,time_delay,signalsXcorr]= calcu(signal1,signal2)
%CALCU 此处显示有关此函数的摘要
%   此处显示详细说明
signalsXcorr=xcorr(signal1,signal2,'unbiased');
[max1,time_delay]=max(signalsXcorr);
time_delay=length(signal1)-time_delay;
end

