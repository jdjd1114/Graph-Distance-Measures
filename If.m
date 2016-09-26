%function If
function I = If(g1,g2,k)

[a,~] = size(g1);
degree1 = zeros(1,a);
num_dk1=0;
num_dklog1=0;
I1=0;
for i=1:a
    for j=1:a
        if g1(i,j) ~= 0
            degree1(i) = degree1(i)+1;
        end
    end
    num_dk1 = num_dk1 + degree1(i)^k;
    num_dklog1 = num_dklog1 + (degree1(i))^k * log((degree1(i))^k);
end
I1 = log(num_dk1)-(num_dklog1)/(num_dk1);

degree2 = zeros(1,a);
num_dk2=0;
num_dklog2=0;
I2=0;
for i=1:a
    for j=1:a
        if g2(i,j) ~= 0
            degree2(i) = degree2(i)+1;
        end
    end
    num_dk2 = num_dk2 + degree2(i)^k;
    num_dklog2 = num_dklog2 + (degree2(i))^k * log((degree2(i))^k);
end
I2 = log(num_dk2)-(num_dklog2)/(num_dk2);
% delta:tree10_0.2 tree9_0.28 graph6_0.08 tree11_0.3 graph5_0.1 graph7_0.05
I = 1 - exp(-(I1-I2)*(I1-I2)/0.28);
