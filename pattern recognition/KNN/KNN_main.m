clear all
clc

load x.m x
load y.m y
DATA=[x y];
label_train=[ones(1,100),zeros(1,100)];

data1=[-0.7303;2.1624];
data2=[1.4445;-0.1649];
data3=[-1.2587;0.9187];
data4=[1.2617;-0.2086];
data5=[0.7302;1.6587];
testdata=[data1 data2 data3 data4 data5];%���ɲ��Լ�

i=0;
for k=1:2:100%ȡ1��100��������Ϊk
    label_test=KNN(k,DATA,label_train,testdata);
    i=i+1;
    for j=1:5
        if(sum(label_test(:,j)==1)>sum(label_test(:,j)==0))%�������ŵ��ǵ���Щѵ������Ԫ�ص�����������
            result(j,i)=1;%����
        else
            result(j,i)=2;
        end
    end
end
%��ͼ
plot(result(1,:),'r');
hold on
plot(result(2,:),'g');
hold on
plot(result(3,:),'b');
hold on
plot(result(4,:),'c');
hold on
plot(result(5,:),'m');
legend('һ��������Kֵ�仯����仯���','����������Kֵ�仯����仯���','����������Kֵ�仯����仯���','�ĺ�������Kֵ�仯����仯���','���������Kֵ�仯����仯���')
xlabel('k�ĵڼ���ȡֵ��1-100��������','fontsize',25)
ylabel('������','fontsize',25)
title('��������kȡֵ��ͬ�ı仯����','fontsize',25)
axis([-3,55,0.75,2.25]);




