clear all;
close all;
clc;

mu1=[0 0]; 
S1=[0.3 0;0 0.35];
data1=mvnrnd(mu1,S1,50); 

mu2=[1.25 1.25];
S2=[0.3 0;0 0.35];
data2=mvnrnd(mu2,S2,50);

mu3=[-1.25 1.25];
S3=[0.3 0;0 0.35];
data3=mvnrnd(mu3,S3,50);

data=[data1;data2;data3];

%% k-means
[center, label] = KMeans(data,3);
[m, n]=size(label);

figure;
hold on;
for i=1:m 
    if label(i)==1   
         plot(data(i,1),data(i,2),'ro'); 
    elseif label(i)==2
         plot(data(i,1),data(i,2),'go'); 
    else 
         plot(data(i,1),data(i,2),'bo'); 
    end
end
grid on;

%% Spectral k-means
[center, label] = Spectral_KMeans(data,3);
[m, n] = size(label);

figure;
hold on;
for i=1:m 
    if label(i)==1   
         plot(data(i,1),data(i,2),'ro'); 
    elseif label(i)==2
         plot(data(i,1),data(i,2),'go'); 
    else 
         plot(data(i,1),data(i,2),'bo'); 
    end
end
grid on;