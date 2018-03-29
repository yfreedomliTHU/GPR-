clear all,close all,clc;%Polynomial Regression
load('data2010.mat');
load('data2011.mat');
load('data2012.mat');
load('data2013.mat');
load('data2014.mat');
%load('GPR.mat');
x = data2014.Score;
y = data2014.TargetScore1;
test_num = find(y == -1);
x_test1 = x(test_num,:)';
%x_test = [x_test1(1:3,:);x_test1(5:7,:)];%2010
%x_test = [x_test1(1:2,:);x_test1(4:5,:);x_test1(7:8,:)];%2011
%x_test =[x_test1(1:3,:);x_test1(5:6,:);x_test1(8,:)];   %2012
x_test = x_test1;   %2013%2014
train_num = find(y ~= -1);
[count,m] = size(train_num);
flag = count;
%flag = floor(count*7/10);
x_train1 = x(train_num,:)';
y_train1 = y(train_num,:);
%x_train = [x_train1(1:3,1:flag);x_train1(5:7,1:flag)]; %2010
%x_train = [x_train1(1:2,1:flag);x_train1(4:5,1:flag);x_train1(7:8,1:flag)]; %2011
%x_train = [x_train1(1:3,1:flag);x_train1(5:6,1:flag);x_train1(8,1:flag)];   %2012
x_train = x_train1(:,1:flag);  %2013&2014
y_train = y_train1(1:flag,:);
%x_test = [x_train1(1:3,flag+1:end);x_train1(5:7,flag+1:end)];%2010
%x_test = [x_train1(1:2,flag+1:end);x_train1(4:5,flag+1:end);x_train1(7:8,flag+1:end)];%2011
%x_test =[x_train1(1:3,flag+1:end);x_train1(5:6,flag+1:end);x_train1(8,flag+1:end)];   %2012
%x_test = x_train1(:,flag+1:end); %2013
%y_test = y_train1(flag+1:end,:);

%Initial
%sigma_n = 3.5;%2010
%sigma_n = 3.9;%2011
sigma_n = 30;%2012 13 14
%Convp = diag(0.4*[1 20 1 1 2 1 1 1 1 1 1 2]); %2010
%Convp = diag(0.4*[10 20 1 1 2 1 1 1 1 1 1 2]); %2011
%Convp = diag(0.4*[0.1 20 1 1 2 1 1 1 1 1 1 10]); %2012
Convp = diag(0.4*[1 10 1 1 1 2 1 1 1 1 1 1 1 1 2 1]);%2013&14
%Calculate
A = sigma_n^(-2)*phi(x_train)*phi(x_train)'+inv(Convp);
Ey = 1/(sigma_n^2)*phi(x_test)'*inv(A)*phi(x_train)*y_train;
y1 = Ey
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
%c = [c;y1];
%save('GPR.mat','c','-append');


