function signal = add_bandpass_noise(signal)
    snr=-2;
    load('8001500bp.mat');
    len=length(signal);
    noise=randn(1,2*len);
    noiseF=filter(higherbp,1,noise);
    noiseExtra=noiseF(len-len/2:len+len/2-1);
    Enoise=noiseExtra*noiseExtra';      %������������
    Esignal=signal*signal';             %�ź���������
    noiseNorl=noiseExtra/sqrt(Enoise);  %������һ
    snr_ratio=10^(-snr/20);
    noiseNor2=noiseNorl*snr_ratio*sqrt(Esignal); %�õ���������
    signal=signal+noiseNor2;
end

