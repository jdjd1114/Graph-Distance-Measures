% function wiener index
function W = Wiener(g1,g2)

[a,~]=size(g1);
dm1 = zeros(a);
for i=1:a
    [dm1(i,:),~,~]=graphshortestpath(sparse(g1),i);
end
W1=0;
for i=1:a
    for j=i+1:a
        W1=W1+dm1(i,j);
    end
end

dm2 = zeros(a);
for i=1:a
    [dm2(i,:),~,~]=graphshortestpath(sparse(g2),i);
end
W2=0;
for i=1:a
    for j=i+1:a
        W2=W2+dm2(i,j);
    end
end 
% delta:tree10_1000 tree9_600 graph6_50 tree11_4000 graph5_100 graph7_200
W = 1 - exp(-(W1-W2)*(W1-W2)/1000);