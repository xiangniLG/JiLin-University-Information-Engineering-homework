function snr = SNR(I,In)
    Ps=sum(sum((I-mean(mean(I))).^2));
    Pn=sum(sum((I-In).^2));
    snr=10*log10(Ps/Pn);
end

