%% generate figure
function []=generate_figure(G,W,R,E,I,X,s)
G1=sort(G);
num_G=count(G1,s,1);
W1=sort(W);
num_W=count(W1,s,1);
R1=sort(R);
num_R=count(R1,s,1);
E1=sort(E);
num_E=count(E1,s,1);
I1=sort(I);
num_I=count(I1,s,1);
% G1=sort(G);
% num_G=count(G1,s,0);
% W1=sort(W);
% num_W=count(W1,s,0);
% R1=sort(R);
% num_R=count(R1,s,0);
% E1=sort(E);
% num_E=count(E1,s,0);
% I1=sort(I);
% num_I=count(I1,s,0);

figure(1);
hold on;
width=800;%宽度，像素数
height=800;%高度
left=200;%距屏幕左下角水平距离
bottem=100;%距屏幕左下角垂直距离
set(gcf,'position',[left,bottem,width,height]);
set(gca,'tickdir','out');
box off;

set(gca, 'XLim',[-0.005 1.0]);                   % X轴的数据显示范围
xlabel('d');
ylabel('# Pairs','Rotation',0.0);
h1 = plot(X,num_G,'b-','Linewidth',1.3);
h2 = plot(X,num_W,'r-','Linewidth',1.3);
h3 = plot(X,num_R,'g-','Linewidth',1.3);
h4 = plot(X,num_E,'y-','Linewidth',1.3);
h5 = plot(X,num_I,'c-','Linewidth',1.3);
legend([h1,h2,h3,h4,h5],'Edit distance', 'Wiener index','Randic index','Energy of graph','Graph entropy','Location','SouthEast');
saveas(gcf,'figure1.fig');
hold off;

num_G=num_G/s;
num_W=num_W/s;
num_R=num_R/s;
num_E=num_E/s;
num_I=num_I/s;
figure(2);
hold on;
width=800;%宽度，像素数
height=800;%高度
left=200;%距屏幕左下角水平距离
bottem=100;%距屏幕左下角垂直距离
set(gcf,'position',[left,bottem,width,height]);
set(gca,'tickdir','out');
box off;
axis([-0.005, 1.0, -0.005, 1.0]);   % 坐标轴的显示范围
xlabel('d');
ylabel('%','Rotation',0.0);
h1 = plot(X,num_G,'b-','Linewidth',1.3);
h2 = plot(X,num_W,'r-','Linewidth',1.3);
h3 = plot(X,num_R,'g-','Linewidth',1.3);
h4 = plot(X,num_E,'y-','Linewidth',1.3);
h5 = plot(X,num_I,'c-','Linewidth',1.3);
legend([h1,h2,h3,h4,h5],'Edit distance', 'Wiener index','Randic index','Energy of graph','Graph entropy','Location','SouthEast');
saveas(gcf,'figure2.fig');
hold off;

figure(3);
hold on;
set(gca,'tickdir','out');
box off;
xlabel('# Pairs','Rotation',0.0);
ylabel('d','Rotation',0.0);
h1 = plot(G,'b-','Linewidth',1.3);
h2 = plot(W,'r-','Linewidth',1.3);
h3 = plot(R,'g-','Linewidth',1.3);
h4 = plot(E,'y-','Linewidth',1.3);
h5 = plot(I,'c-','Linewidth',1.3);
legend([h1,h2,h3,h4,h5],'Edit distance', 'Wiener index','Randic index','Energy of graph','Graph entropy','Location','SouthEast');
saveas(gcf,'figure3.fig');
hold off;