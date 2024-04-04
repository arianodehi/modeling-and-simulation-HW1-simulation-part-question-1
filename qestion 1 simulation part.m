clc;
clear;
close all;
%% importing files
A = importdata('batch-yield-and-purity.csv');
u = A(:,1);
y = A(:,2);
% normalizing the data 
u = (u-min(u))/(max(u)-min(u));
y = (y-min(y))/(max(y)-min(y));

figure(1)
scatter(u, y);
xlabel('yield of ractor(normalize)');
ylabel('purity of output(normalize)');
%% least squer without command
theta = pinv(u)*y;
y_fit = theta * u;
figure;
scatter(u,y,'filled');
hold on;
scatter(u,y_fit,"green",'filled');
xlabel('yield of ractor(normalize)');
ylabel('purity of output(normalize)');
legend('actual data','fit line');
title("least squer fitted line");
grid on;
hold off;
%% least squer with command
theta =lsqr(u,y);
y_fit = theta * u;
figure;
scatter(u,y,'filled');
hold on;
scatter(u,y_fit,"red",'filled');
xlabel('yield of ractor(normalize)');
ylabel('purity of output(normalize)');
legend('actual data','fit line');
title("least squer fitted line");
grid on;
hold off;
