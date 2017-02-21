%% ImageClassifyLibsvm
% a litter test of image classification based on libsvm
% by xiaochou
% last modified 2016.05.07
%% ��ջ�������
close all;
clear all;
clc;
%% ��ȡͼ��
pic = imread('1.bmp');
figure;
imshow(pic);
%% ѡ��ѵ�����ϲ��Լ�
TrainData_sea = zeros(100,3,'double');
TrainData_forest = zeros(100,3,'double');
TrainData_beach = zeros(100,3,'double');
TrainData_earth = zeros(100,3,'double');
TrainData_Smalltree = zeros(100,3,'double');
TrainData_Road = zeros(100,3,'double');
% ����
msgbox('Please separate sea samples','sea Samples','help');
pause;
[x,y] = ginput(2);
hold on;
plot(x,y,'r*');
x = uint16(x);
y = uint16(y);
TrainData_seas = pic(y(1):y(2),x(1):x(2),1:3);
[X,Y,P] = size(TrainData_seas);
run = 1;
for i = 1:X
    for j = 1:Y
        TrainData_sea(run,1) = TrainData_seas(i,j,1);
        TrainData_sea(run,2) = TrainData_seas(i,j,2);
        TrainData_sea(run,3) = TrainData_seas(i,j,3);
        run = run+1;
    end
end
randindex = randperm(X*Y);% �����1��X*Y��������
TrainData_sea = TrainData_sea(randindex(1:100),:);

msgbox('Please separate forest samples','forest Samples','help');
pause;
[x,y] = ginput(2);
hold on;
plot(x,y,'bo')
x = uint16(x);
y = uint16(y);
TrainData_forests = pic(y(1):y(2),x(1):x(2),1:3);
[X,Y,P] = size(TrainData_forests);
run = 1;
for i = 1:X
    for j = 1:Y
        TrainData_forest(run,1) = TrainData_forests(i,j,1);
        TrainData_forest(run,2) = TrainData_forests(i,j,2);
        TrainData_forest(run,3) = TrainData_forests(i,j,3);
        run = run+1;
    end
end
randindex = randperm(X*Y);% �����1��X*Y��������
TrainData_forest = TrainData_forest(randindex(1:100),:);

msgbox('Please separate beach samples','beach Samples','help');
pause;
[x,y] = ginput(2);
hold on;
plot(x,y,'g.')
x = uint16(x);
y = uint16(y);
TrainData_beachs = pic(y(1):y(2),x(1):x(2),1:3);
[X,Y,P] = size(TrainData_beachs);
run = 1;
for i = 1:X
    for j = 1:Y
        TrainData_beach(run,1) = TrainData_beachs(i,j,1);
        TrainData_beach(run,2) = TrainData_beachs(i,j,2);
        TrainData_beach(run,3) = TrainData_beachs(i,j,3);
        run = run+1;
    end
end
randindex = randperm(X*Y);% �����1��X*Y��������
TrainData_beach = TrainData_beach(randindex(1:100),:);

msgbox('Please separate earth samples','earth Samples','help');
pause;
[x,y] = ginput(2);
hold on;
plot(x,y,'b*')
x = uint16(x);
y = uint16(y);
TrainData_earths = pic(y(1):y(2),x(1):x(2),1:3);
[X,Y,P] = size(TrainData_earths);
run = 1;
for i = 1:X
    for j = 1:Y
        TrainData_earth(run,1) = TrainData_earths(i,j,1);
        TrainData_earth(run,2) = TrainData_earths(i,j,2);
        TrainData_earth(run,3) = TrainData_earths(i,j,3);
        run = run+1;
    end
end
randindex = randperm(X*Y);% �����1��X*Y��������
TrainData_earth = TrainData_earth(randindex(1:100),:);

msgbox('Please separate Smalltrees samples','Smalltrees Samples','help');
pause;
[x,y] = ginput(2);
hold on;
plot(x,y,'r*')
x = uint16(x);
y = uint16(y);
TrainData_Smalltrees = pic(y(1):y(2),x(1):x(2),1:3);
[X,Y,P] = size(TrainData_Smalltrees);
run = 1;
for i = 1:X
    for j = 1:Y
        TrainData_Smalltree(run,1) = TrainData_Smalltrees(i,j,1);
        TrainData_Smalltree(run,2) = TrainData_Smalltrees(i,j,2);
        TrainData_Smalltree(run,3) = TrainData_Smalltrees(i,j,3);
        run = run+1;
    end
end
randindex = randperm(X*Y);% �����1��X*Y��������
TrainData_Smalltree = TrainData_Smalltree(randindex(1:100),:);

msgbox('Please separate Roads samples','Roads Samples','help');
pause;
[x,y] = ginput(2);
hold on;
plot(x,y,'r*')
x = uint16(x);
y = uint16(y);
TrainData_Roads = pic(y(1):y(2),x(1):x(2),1:3);
[X,Y,P] = size(TrainData_Roads);
run = 1;
for i = 1:X
    for j = 1:Y
        TrainData_Road(run,1) = TrainData_Roads(i,j,1);
        TrainData_Road(run,2) = TrainData_Roads(i,j,2);
        TrainData_Road(run,3) = TrainData_Roads(i,j,3);
        run = run+1;
    end
end
randindex = randperm(X*Y);% �����1��X*Y��������
TrainData_Road = TrainData_Road(randindex(1:100),:);
save('trainPatch','TrainData_seas','TrainData_forests','TrainData_beachs','TrainData_earths','TrainData_Smalltrees','TrainData_Roads')
% ȷ��ѵ������ѵ����ǩ
pic1(1:100,1) = 1;
pic2(1:100,1) = 2;
pic3(1:100,1) = 3;
pic4(1:100,1) = 4;
pic5(1:100,1) = 5;
pic6(1:100,1) = 6;
Train_label = [pic1;pic2;pic3;pic4;pic5;pic6];
Train_data = [TrainData_sea;TrainData_forest;TrainData_beach;TrainData_earth;TrainData_Smalltree;TrainData_Road];
% ȷ�����Լ��Ͳ��Ա�ǩ
[X,Y,P] = size(pic);
TestData = zeros(X*Y,3,'double');
k = 1;
for i = 1:X
    for j = 1:Y
        TestData(k,1) = pic(i,j,1);
        TestData(k,2) = pic(i,j,2);
        TestData(k,3) = pic(i,j,3);
        k = k+1;
    end
end
Test_data =TestData;
Test_label = [ones(length(TestData)/6,1);2*ones(length(TestData)/6,1);3*ones(length(TestData)/6,1);4*ones(length(TestData)/6,1);5*ones(length(TestData)/6,1);6*ones(length(TestData)/6,1)];
%% ��ģԤ��
% ����ѵ�����Ͻ�������ģ��
model = svmtrain(Train_label,Train_data,'-c 1 -g 0.2 b 1');
[predict_label,accuracy,decision_values] = svmpredict(Test_label,Test_data,model);
%% ������ӻ�
result=zeros(X,Y,3); % RGB��ͼ
    for k=1:X*Y                %     R����            G����            B����
        if (predict_label(k,1)==1)    Test_data(k,1)=0;Test_data(k,2)=0;Test_data(k,3)=255; % ��ɫ
        elseif(predict_label(k,1)==2)  Test_data(k,1)=0;Test_data(k,2)=255; Test_data(k,3)=0; % ��ɫ
        elseif(predict_label(k,1)==3)  Test_data(k,1)=255;Test_data(k,2)=255; Test_data(k,3)=255; % ��ɫ
        elseif(predict_label(k,1)==4)   Test_data(k,1)=0; Test_data(k,2)=0;  Test_data(k,3)=0; % ��ɫ
        elseif(predict_label(k,1)==5)   Test_data(k,1)=204; Test_data(k,2)=0;  Test_data(k,3)=153; % ��ɫ
        elseif(predict_label(k,1)==6)   Test_data(k,1)=255; Test_data(k,2)=255;  Test_data(k,3)=0; % ��ɫ
        end
    end
k=1;
for i = 1:X
    for j=1:Y
       result(i,j,1)=Test_data(k,1); 
       result(i,j,2)=Test_data(k,2);   
       result(i,j,3)=Test_data(k,3); 
       k=k+1;
    end
end
result=uint8(result);
figure;imshow(result);


    