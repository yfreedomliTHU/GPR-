clear all,close all,clc;%GPR
load('data2010.mat');
load('data2011.mat');
load('data2012.mat');
load('data2013.mat');
load('data2014.mat');
%load('GPR.mat')
x = data2012.Score;
y = data2012.TargetScore1;
test_num = find(y == -1);
x_test1 = x(test_num,:)';
%x_test = [x_test1(1:3,:);x_test1(5:7,:)];%2010
%x_test = [x_test1(1:2,:);x_test1(4:5,:);x_test1(7:8,:)];%2011
x_test =[x_test1(1:3,:);x_test1(5:6,:);x_test1(8,:)];   %2012
%x_test = x_test1;   %2013%2014
train_num = find(y ~= -1);
[count,m] = size(train_num);
flag = count;
%flag = floor(count*7/10); % 80% data train,20% data test
x_train1 = x(train_num,:)';
y_train1 = y(train_num,:);
%x_train = [x_train1(1:3,1:flag);x_train1(5:7,1:flag)]; %2010
%x_train = [x_train1(1:2,1:flag);x_train1(4:5,1:flag);x_train1(7:8,1:flag)]; %2011
x_train = [x_train1(1:3,1:flag);x_train1(5:6,1:flag);x_train1(8,1:flag)];   %2012
%x_train = x_train1(1:8,1:flag);  %2013&2014
y_train = y_train1(1:flag,:);

%x_test = [x_train1(1:2,flag+1:end);x_train1(7,flag+1:end)];%2010
%x_test = [x_train1(1:2,flag+1:end);x_train1(4:5,flag+1:end);x_train1(7:8,flag+1:end)];%2011
%x_test =[x_train1(1:3,flag+1:end);x_train1(5:6,flag+1:end);x_train1(8,flag+1:end)];   %2012
%x_test = x_train1(1:8,flag+1:end);   %2013&2014
%y_test = y_train1(flag+1:end,:);

%Initial
%sigma_n = 1.6;%2010 1.6
%sigma_n = 0.6;%2011
sigma_n = 0.4;%2012
%sigma_n =1.2 ;%2013 
%sigma_n =0.7 ;%2014 
[M N] = size(x_train);
I = eye(N);
%Calculate
Ey = K(x_test,x_train)*((K(x_train,x_train)+sigma_n^2*I)^-1)*y_train;
y1 = Ey
% %MSE
% temp_erro = y1-y_test 
% error = temp_erro.^2;
% [n,m] = size(error);
% MSE = sum(error)/n
%plot
% figure(1);
% plot(1:count,y_train1,['*','k']);
% hold on;
% plot(flag+1:count,y1,['*','r']);
% figure(2);
% [len wid] = size(y_test);
% plot(1:len,temp_erro,['-*','b']);

%Save data
%d = [d;y1];
%save('GPR.mat','d','-append');
%optimal = [optimal;y1];
%save('GPR.mat','optimal','-append');

