function [label_test] =KNN(k,trainData,label_train,testData)
%k:����ֵ
%testData:�������ݣ�M*N����
%trainData:ѵ�����ݣ�M*N����
%label_train:ѵ�������������ı�ţ�1*N�ľ���
%label_test:����������Ӧk�������ѵ����������ţ�������

dist=l2_distance(trainData,testData);
[~,nearest]=sort(dist);%����
nearest=nearest(1:k,:);%ȡǰk����Ҳ���������k��
label_test=label_train(nearest);%ȥ������ѵ����

end

