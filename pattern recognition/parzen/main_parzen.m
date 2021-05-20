clear all;
x=load('x.m');
px=normpdf(x,0,1);

N=1;
h1=0.25;
pNx=zeros(1,length(x));
hN=h1/sqrt(N);
for j=1:length(x)
    for i=1:N
        pNx(j)=pNx(j)+exp(((x(j)-x(i))/hN).^2/-2)/sqrt(2*pi);
    end
    pNx(j)=pNx(j)/hN/N;
end
subplot(3,5,1),plot(x,pNx,'.');
title('估计概率分布')
grid on

N=16;
h1=0.25;
pNx=zeros(1,length(x));
hN=h1/sqrt(N);
for j=1:length(x)
    for i=1:N
        pNx(j)=pNx(j)+exp(((x(j)-x(i))/hN).^2/-2)/sqrt(2*pi);
    end
    pNx(j)=pNx(j)/hN/N;
end
subplot(3,5,2),plot(x,pNx,'.');
title('估计概率分布')
grid on

N=256;
h1=0.25;
pNx=zeros(1,length(x));
hN=h1/sqrt(N);
for j=1:length(x)
    for i=1:N
        pNx(j)=pNx(j)+exp(((x(j)-x(i))/hN).^2/-2)/sqrt(2*pi);
    end
    pNx(j)=pNx(j)/hN/N;
end
subplot(3,5,3),plot(x,pNx,'.');
title('估计概率分布')
grid on

N=1024;
h1=0.25;
pNx=zeros(1,length(x));
hN=h1/sqrt(N);
for j=1:length(x)
    for i=1:N
        pNx(j)=pNx(j)+exp(((x(j)-x(i))/hN).^2/-2)/sqrt(2*pi);
    end
    pNx(j)=pNx(j)/hN/N;
end
subplot(3,5,4),plot(x,pNx,'.');
title('估计概率分布')
grid on

N=4096;
h1=0.25;
pNx=zeros(1,length(x));
hN=h1/sqrt(N);
for j=1:length(x)
    for i=1:N
        pNx(j)=pNx(j)+exp(((x(j)-x(i))/hN).^2/-2)/sqrt(2*pi);
    end
    pNx(j)=pNx(j)/hN/N;
end
subplot(3,5,5),plot(x,pNx,'.');
title('估计概率分布')
grid on

N=1;
h1=1;
pNx=zeros(1,length(x));
hN=h1/sqrt(N);
for j=1:length(x)
    for i=1:N
        pNx(j)=pNx(j)+exp(((x(j)-x(i))/hN).^2/-2)/sqrt(2*pi);
    end
    pNx(j)=pNx(j)/hN/N;
end
subplot(3,5,6),plot(x,pNx,'.');
title('估计概率分布')
grid on

N=16;
h1=1;
pNx=zeros(1,length(x));
hN=h1/sqrt(N);
for j=1:length(x)
    for i=1:N
        pNx(j)=pNx(j)+exp(((x(j)-x(i))/hN).^2/-2)/sqrt(2*pi);
    end
    pNx(j)=pNx(j)/hN/N;
end
subplot(3,5,7),plot(x,pNx,'.');
title('估计概率分布')
grid on

N=256;
h1=1;
pNx=zeros(1,length(x));
hN=h1/sqrt(N);
for j=1:length(x)
    for i=1:N
        pNx(j)=pNx(j)+exp(((x(j)-x(i))/hN).^2/-2)/sqrt(2*pi);
    end
    pNx(j)=pNx(j)/hN/N;
end
subplot(3,5,8),plot(x,pNx,'.');
title('估计概率分布')
grid on

N=1024;
h1=1;
pNx=zeros(1,length(x));
hN=h1/sqrt(N);
for j=1:length(x)
    for i=1:N
        pNx(j)=pNx(j)+exp(((x(j)-x(i))/hN).^2/-2)/sqrt(2*pi);
    end
    pNx(j)=pNx(j)/hN/N;
end
subplot(3,5,9),plot(x,pNx,'.');
title('估计概率分布')
grid on

N=4096;
h1=1;
pNx=zeros(1,length(x));
hN=h1/sqrt(N);
for j=1:length(x)
    for i=1:N
        pNx(j)=pNx(j)+exp(((x(j)-x(i))/hN).^2/-2)/sqrt(2*pi);
    end
    pNx(j)=pNx(j)/hN/N;
end
subplot(3,5,10),plot(x,pNx,'.');
title('估计概率分布')
grid on

N=1;
h1=4;
pNx=zeros(1,length(x));
hN=h1/sqrt(N);
for j=1:length(x)
    for i=1:N
        pNx(j)=pNx(j)+exp(((x(j)-x(i))/hN).^2/-2)/sqrt(2*pi);
    end
    pNx(j)=pNx(j)/hN/N;
end
subplot(3,5,11),plot(x,pNx,'.');
title('估计概率分布')
grid on

N=16;
h1=4;
pNx=zeros(1,length(x));
hN=h1/sqrt(N);
for j=1:length(x)
    for i=1:N
        pNx(j)=pNx(j)+exp(((x(j)-x(i))/hN).^2/-2)/sqrt(2*pi);
    end
    pNx(j)=pNx(j)/hN/N;
end
subplot(3,5,12),plot(x,pNx,'.');
title('估计概率分布')
grid on

N=256;
h1=4;
pNx=zeros(1,length(x));
hN=h1/sqrt(N);
for j=1:length(x)
    for i=1:N
        pNx(j)=pNx(j)+exp(((x(j)-x(i))/hN).^2/-2)/sqrt(2*pi);
    end
    pNx(j)=pNx(j)/hN/N;
end
subplot(3,5,13),plot(x,pNx,'.');
title('估计概率分布')
grid on

N=1024;
h1=4;
pNx=zeros(1,length(x));
hN=h1/sqrt(N);
for j=1:length(x)
    for i=1:N
        pNx(j)=pNx(j)+exp(((x(j)-x(i))/hN).^2/-2)/sqrt(2*pi);
    end
    pNx(j)=pNx(j)/hN/N;
end
subplot(3,5,14),plot(x,pNx,'.');
title('估计概率分布')
grid on

N=4096;
h1=4;
pNx=zeros(1,length(x));
hN=h1/sqrt(N);
for j=1:length(x)
    for i=1:N
        pNx(j)=pNx(j)+exp(((x(j)-x(i))/hN).^2/-2)/sqrt(2*pi);
    end
    pNx(j)=pNx(j)/hN/N;
end
subplot(3,5,15),plot(x,pNx,'.');
title('估计概率分布')
grid on