clear;
clc;

global color; %画图时使用的颜色矩阵
global fig_num; %画图时使用的图形框数目

fig_num=1;
color=[1, 0, 0;
    0, 1, 0;
    0, 0, 1];
color=[color; rand(7, 3)];

%第一类数据
mu1=[0, 0]; %均值
% S1=[0.2, 0; %协方差矩阵
%     0, 0.2];
S1=[0.8, 0; %协方差矩阵
    0, 0.8];
data1=mvnrnd(mu1, S1, 100); %产生二维高斯分布数据点

%第二类数据
mu2=[1.25, 1.25];
% S2=[0.2, 0;
%     0, 0.2];
S2=[0.8, 0;
    0, 0.8];
data2=mvnrnd(mu2, S2, 100);

%第三类数据
mu3=[-1.25, 1.25];
% S3=[0.2, 0;
%     0, 0.2];
S3=[0.8, 0;
    0, 0.8];
data3=mvnrnd(mu3, S3, 100);

%显示数据
figure(fig_num);
fig_num=fig_num+1;
hold on;
plot(data1(:, 1), data1(:, 2), 'color', color(1, :), 'linestyle', 'o');
plot(data2(:, 1), data2(:, 2), 'color', color(2, :), 'linestyle', 'o');
plot(data3(:, 1), data3(:, 2), 'color', color(3, :), 'linestyle', 'o');
hold off;

data=[data1;data2;data3];

%使用kmeans算法进行聚类
K=3; %聚类的数量
[ldx, C]=k_means(data, K);
[ldx, C]=k_means(data, K);

%使用Sequential Leader Clustering算法进行聚类
threshold=0.3; %SLC算法中的阈值
[K, ldx, C]=SLC(data, threshold);
threshold=0.4;
[K, ldx, C]=SLC(data, threshold);
threshold=0.5;
[K, ldx, C]=SLC(data, threshold);
data_new=data(randperm(size(data, 1)), :); %改变序列中数据的排列顺序
[K, ldx, C]=SLC(data_new, threshold);

%使用聚类算法实现图像的分割
img=imread('lena.png');
img_gray=rgb2gray(img);

%对灰度图像进行聚类分割
figure;
imshow(img_gray);
imwrite(img_gray, 'lena_gray.jpg');

[height, width, dim]=size(img_gray);
data=img2data(img_gray, height, width, dim); %将灰度图像矩阵转换为对应的聚类算法处理格式

K=3;
[ldx, C]=k_means(data, K); %采用kmeans算法分割图像
img_new_gray=cluster_img(ldx, K, height, width); %将聚类结果以不同的灰度值显示在图像中
figure;
imshow(img_new_gray);
imwrite(img_new_gray, 'lena_gray_km.jpg');

[K, ldx, C]=SLC(data, 0.4);
img_new_gray=cluster_img(ldx, K, height, width); %采用Sequential Leader Clustering算法分割图像
figure;
imshow(img_new_gray);
imwrite(img_new_gray, 'lena_gray_slc.jpg');

%对彩色图像进行聚类分割
figure;
imshow(img);

[height, width, dim]=size(img);
data=img2data(img, height, width, dim); %将彩色图像转换到HSI空间，并将I分量转换为对应的聚类算法处理格式

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
