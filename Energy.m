% function energy
function E = Energy(g1,g2)
%%
E1=0;
E2=0;
[~,d1] = eig(g1);
[~,d2] = eig(g2);

[a,~] = size(g1);
for i=1:a
    E1=E1+abs(d1(i,i));
end

for i=1:a
    E2=E2+abs(d2(i,i));
end
% delta:tree10_2 tree9_4 graph6_4 tree11_4
E = 1 - exp(-(E1-E2)*(E1-E2)/2);