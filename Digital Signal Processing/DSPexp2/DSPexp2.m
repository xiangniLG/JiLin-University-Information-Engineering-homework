% 三角波作图
    DSPexp2_Tri_wave_analysis(1);
%FFT
    DSPexp2_FFTcos(50,0.000625,64,2);
    DSPexp2_FFTcos(50,0.000625,32,3);
    DSPexp2_FFTcos(50,0.005,32,4);
    DSPexp2_FFTcos(50,0.0046875,32,5);
    DSPexp2_FFTcos(50,0.004,32,6);
%dft、fft速度比较
    DSPexp2_speed_comparision(64,7)
%几组卷积计算
    %第一组：
        n1=1:14;
        x1n=ones(1,14);
        h1n=(4/5).^n1;
        DSPexp2_cov_calculate(x1n,h1n,8);
    %第二组
        x2n([1:10])=1;
        n2=1:20;
        h2n=0.5*sin(0.5*n2);
        DSPexp2_cov_calculate(x2n,h2n,9);
    %第三组
        n3=1:10;
        x3n=1-0.1*n3;
        h3n=0.1*n3;
        DSPexp2_cov_calculate(x3n,h3n,10);