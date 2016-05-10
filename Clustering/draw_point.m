function draw_point(X, ldx, C, K)
%画出当前的聚类情况

global color;
global fig_num;

[row, col]=size(X);
data=cell(K, 1);
for i=1:row
    data{ldx(i)}=[data{ldx(i)}; X(i, :)];
end

figure(fig_num);
fig_num=fig_num+1;
hold on;
for i=1:K
    plot(data{i}(:, 1), data{i}(:, 2), 'color', color(i, :), 'linestyle', 'o'); %画出当前类中所有的点
    plot(C(i, 1), C(i, 2), 'k+', 'markersize', 10); %画出聚类中心
end
hold off;
