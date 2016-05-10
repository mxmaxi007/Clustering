clear;
clc;

global color; %��ͼʱʹ�õ���ɫ����
global fig_num; %��ͼʱʹ�õ�ͼ�ο���Ŀ

fig_num=1;
color=[1, 0, 0;
    0, 1, 0;
    0, 0, 1];
color=[color; rand(7, 3)];

%��һ������
mu1=[0, 0]; %��ֵ
% S1=[0.2, 0; %Э�������
%     0, 0.2];
S1=[0.8, 0; %Э�������
    0, 0.8];
data1=mvnrnd(mu1, S1, 100); %������ά��˹�ֲ����ݵ�

%�ڶ�������
mu2=[1.25, 1.25];
% S2=[0.2, 0;
%     0, 0.2];
S2=[0.8, 0;
    0, 0.8];
data2=mvnrnd(mu2, S2, 100);

%����������
mu3=[-1.25, 1.25];
% S3=[0.2, 0;
%     0, 0.2];
S3=[0.8, 0;
    0, 0.8];
data3=mvnrnd(mu3, S3, 100);

%��ʾ����
figure(fig_num);
fig_num=fig_num+1;
hold on;
plot(data1(:, 1), data1(:, 2), 'color', color(1, :), 'linestyle', 'o');
plot(data2(:, 1), data2(:, 2), 'color', color(2, :), 'linestyle', 'o');
plot(data3(:, 1), data3(:, 2), 'color', color(3, :), 'linestyle', 'o');
hold off;

data=[data1;data2;data3];

%ʹ��kmeans�㷨���о���
K=3; %���������
[ldx, C]=k_means(data, K);
[ldx, C]=k_means(data, K);

%ʹ��Sequential Leader Clustering�㷨���о���
threshold=0.3; %SLC�㷨�е���ֵ
[K, ldx, C]=SLC(data, threshold);
threshold=0.4;
[K, ldx, C]=SLC(data, threshold);
threshold=0.5;
[K, ldx, C]=SLC(data, threshold);
data_new=data(randperm(size(data, 1)), :); %�ı����������ݵ�����˳��
[K, ldx, C]=SLC(data_new, threshold);

%ʹ�þ����㷨ʵ��ͼ��ķָ�
img=imread('lena.png');
img_gray=rgb2gray(img);

%�ԻҶ�ͼ����о���ָ�
figure;
imshow(img_gray);
imwrite(img_gray, 'lena_gray.jpg');

[height, width, dim]=size(img_gray);
data=img2data(img_gray, height, width, dim); %���Ҷ�ͼ�����ת��Ϊ��Ӧ�ľ����㷨�����ʽ

K=3;
[ldx, C]=k_means(data, K); %����kmeans�㷨�ָ�ͼ��
img_new_gray=cluster_img(ldx, K, height, width); %���������Բ�ͬ�ĻҶ�ֵ��ʾ��ͼ����
figure;
imshow(img_new_gray);
imwrite(img_new_gray, 'lena_gray_km.jpg');

[K, ldx, C]=SLC(data, 0.4);
img_new_gray=cluster_img(ldx, K, height, width); %����Sequential Leader Clustering�㷨�ָ�ͼ��
figure;
imshow(img_new_gray);
imwrite(img_new_gray, 'lena_gray_slc.jpg');

%�Բ�ɫͼ����о���ָ�
figure;
imshow(img);

[height, width, dim]=size(img);
data=img2data(img, height, width, dim); %����ɫͼ��ת����HSI�ռ䣬����I����ת��Ϊ��Ӧ�ľ����㷨�����ʽ

K=3;
[ldx, C]=k_means(data, K);
img_new=cluster_img(ldx, K, height, width);
figure;
imshow(img_new);
imwrite(img_new, 'lena_km.jpg');

[K, ldx, C]=SLC(data, 0.4);
img_new=cluster_img(ldx, K, height, width);
figure;
imshow(img_new);
imwrite(img_new, 'lena_slc.jpg');
