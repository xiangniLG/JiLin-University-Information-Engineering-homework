function  [max1,time_delay,signalsXcorr]= calcu(signal1,signal2)
%CALCU �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
signalsXcorr=xcorr(signal1,signal2,'unbiased');
[max1,time_delay]=max(signalsXcorr);
time_delay=length(signal1)-time_delay;
end

