
%%%将输出编码的对应顶点个数图转换成邻接矩阵输出

clear all
fid1=fopen('tree10.txt','rt');    %打开文件
s=fscanf(fid1,'%c');    %按字符读入s
R= abs(s)  ;  %转化成ACSII码值输出
[hang,lie]=size(R);
graph_num=1;
num=1;
for i=1:lie
    if(R(:,i)~=10)
        R_NEW(graph_num,num)=R(:,i);
        num=num+1;
    end
    if(R(:,i)==10)
        graph_num=graph_num+1;
        num=1;
    end
end
[graph_num,colu]=size(R_NEW); %%解码过程
n=R_NEW(1,1)-63;

for adj_num=1:graph_num
   adj=zeros(n,n);
   b=0;
   seq=R_NEW(adj_num,2:colu);
   
  for asc=1:(colu-1)
a=seq(:,asc)-63;
if (asc==1)
b=dec2bin(a,6);
end
if (asc>1)
b=[b,dec2bin(a,6)];
end
  end
  
for edgejuge=1:(n*(n-1)/2)
    if((edgejuge==1)&&(b(1,edgejuge)=='1'))
        adj(1,2)=1;
        adj(2,1)=1;
    end
        if((edgejuge==2)&&(b(1,edgejuge)=='1'))
        adj(1,3)=1;
        adj(3,1)=1;
        end
        if((edgejuge==3)&&(b(1,edgejuge)=='1'))
        adj(2,3)=1;
        adj(3,2)=1;
        end    
    if((edgejuge==4)&&(b(1,edgejuge)=='1'))
        adj(1,4)=1;
        adj(4,1)=1;
    end
        if((edgejuge==5)&&(b(1,edgejuge)=='1'))
        adj(2,4)=1;
        adj(4,2)=1;
        end
        if((edgejuge==6)&&(b(1,edgejuge)=='1'))
        adj(3,4)=1;
        adj(4,3)=1;
        end
        
        if((edgejuge>6)&&(b(1,edgejuge)=='1'))
            for four=4:(n*(n-1)/2)
            if(((edgejuge-four*(four-1)/2)<=four)&&((edgejuge-four*(four-1)/2)>0))
                inord=edgejuge-four*(four-1)/2;
                adj(inord,(four+1))=1;
                adj((four+1),inord)=1;
            end

            end
        end
        
    
end
filename=strcat('v',num2str(n),'graph',num2str(adj_num),'.txt');

% save filename adj -ascii;   输出邻接矩阵

  fid=fopen(filename,'a+');
  for ih=1:n
      for jl=1:n
  if(jl<n)
  fprintf(fid,'%g\t',adj(ih,jl));

  end
  if(jl==n)
fprintf(fid,'%g\n',adj(ih,jl));
  end
 
      end
  end
   fclose(fid);
end
filename2=strcat('v',num2str(n),'.txt');
fid2=fopen(filename2,'a+');
fprintf(fid2,'%g\n',graph_num);
fclose(fid2);


 
