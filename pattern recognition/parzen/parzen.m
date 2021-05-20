function [] = parzen(h1,N)

hN=h1/sqrt(N);
a=-5:0.05:5;
x=randn(1,10000);
m=numel(a);
pN_x=zeros(1,m);

for j=1:m
    for i=1:N
        pN_x(j)=(exp(-(x(j)-x(i))^2/(2*hN*hN)))/((2*pi)^0.5)+pN_x(j);
    end
    pN_x(j)=pN_x(j)/N/hN;
end

plot(a,pN_x,'k-')





