clear;
close all;
clc;
num=input('Please input vertice_num:(i.e. x+2)\n','s');
num=str2double(num);
max_dis = num*(num-1)*0.5 - (num-1);
name = ['v',num2str(num),'.txt'];
s = load(name);
size = s*(s-1)/2;
W = zeros(1,size);
R = zeros(1,size);
E = zeros(1,size);
I = zeros(1,size);
G = zeros(1,size);
a=1;
%max_dis = num*(num-1)*0.5 - (num-1);
% Wiener index
for i=1:s
    for j=(i+1):s
        g1_name = ['v',num2str(num),'graph',num2str(i),'.txt'];
        g2_name = ['v',num2str(num),'graph',num2str(j),'.txt'];
        
        g1 = load(g1_name);
        g2 = load(g2_name);
        
        W(a) = Wiener(g1,g2);
        R(a) = Randic(g1,g2,1);
        E(a) = Energy(g1,g2);
        I(a) = If(g1,g2,2);
        G(a) = Graph(g1,g2);
       
        a=a+1;
    end
end
G = G/max(G);
%%
% save graphdata9.mat W R E I G
csvwrite('graph5data.csv',[W;R;E;I;G]);%保存结果为csv文件
%% 画图
% for i=1:200
%     X(i) = i*0.005;
% end
X = [0.005,0.01,0.02,0.03,0.04,0.05,0.06,0.07,0.08,0.09,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];
generate_figure(G,W,R,E,I,X,size);
%% 最小二乘距离
lsd = LSD(G,W,R,E,I);