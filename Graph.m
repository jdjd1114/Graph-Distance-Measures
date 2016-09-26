%function Graph edit distance
function G = Graph(g1,g2)
%%
[a,~]=size(g1);
d=0;
for i=1:a
    for j=i+1:a
        if g1(i,j) ~= g2(i,j);
            d = d + 1;
        end
    end
end

G = d;