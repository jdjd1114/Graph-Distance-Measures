%function randic index
function R = Randic(g1,g2,x)
%%
[a,~] = size(g1);
degree1 = zeros(1,a);
R1=0;
R10=0;
for i=1:a
    for j=1:a
        if g1(i,j) ~= 0
            degree1(i) = degree1(i)+1;
        end
    end
end
for i=1:a
    for j=i+1:a
        if g1(i,j) ~= 0
            R1 = R1 + ( degree1(i) * degree1(j) )^(-0.5);
        end
    end
    R10 = R10 + (degree1(i)^(-0.5));
end
%%
R2=0;
R20=0;
degree2 = zeros(1,a);
for i=1:a
    for j=1:a
        if g2(i,j) ~= 0
            degree2(i) = degree2(i)+1;
        end
    end
end
for i=1:a
    for j=i+1:a
        if g2(i,j) ~= 0
            R2 = R2 + (degree2(i)*degree2(j))^(-0.5);
        end
    end
    R20 = R20 + (degree2(i)^(-0.5));
end
% delta:tree10_0.3 tree9_0.2 graph6_0.04 tree11_0.35 graph5_0.05
if x~=0
    R = 1 - exp(-(R1-R2)*(R1-R2)/0.2);
else
    R = 1 - exp(-(R10-R20)*(R10-R20)/0.2);
end