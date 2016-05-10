function draw_point(X, ldx, C, K)
%������ǰ�ľ������

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
    plot(data{i}(:, 1), data{i}(:, 2), 'color', color(i, :), 'linestyle', 'o'); %������ǰ�������еĵ�
    plot(C(i, 1), C(i, 2), 'k+', 'markersize', 10); %������������
end
hold off;
