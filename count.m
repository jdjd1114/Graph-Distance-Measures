function [num] = count(W,n,sign)

if sign == 1
    num = zeros(1,20);
    for i=1:n
         if W(i)<=0.005
             num(1)=num(1)+1;
         end
         if W(i)<=0.01
             num(2) = num(2)+1;
         end
         if W(i)<=0.02 
              num(3) = num(3)+1;
         end
         if W(i)<=0.03
             num(4) = num(4)+1;
         end
         if W(i)<=0.04
             num(5) = num(5)+1;
         end
         if W(i)<=0.05
             num(6) = num(6)+1;
         end
         if W(i)<=0.06
             num(7) = num(7)+1;
         end
         if W(i)<=0.07
             num(8) = num(8)+1;
         end
         if W(i)<=0.08
             num(9) = num(9) +1;
         end
         if W(i)<=0.09
             num(10) = num(10)+1;
         end
         if W(i)<=0.1
             num(11)=num(11)+1;
         end
         if W(i)<=0.2 
             num(12) = num(12)+1;
         end
         if W(i)<=0.3 
             num(13) = num(13)+1;
         end
         if W(i)<=0.4
             num(14) = num(14)+1;
         end
         if W(i)<=0.5
             num(15) = num(15)+1;
         end
         if W(i)<=0.6
             num(16) = num(16)+1;
         end
         if W(i)<=0.7
             num(17) = num(17)+1;
         end
         if W(i)<=0.8
             num(18) = num(18)+1;
         end
         if W(i)<=0.9
             num(19) = num(19) +1;
         end
         if W(i)<=1
             num(20) = num(20)+1;
         end
    end
else
    num = zeros(1,200);
    for i=1:n
        for j=1:200
            if W(i)<=0.005 * j
                num(j) = num(j) + 1;
            end
        end
    end
end