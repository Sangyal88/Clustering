


function [ c, temp ] = cluster_2( l, h, temp, A1 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[row,col] = size(temp);
c().clus = zeros(row,col);
k=1;
n=l;
count=0;
while(n<h+1)
    
    for i=1:row
        for j=1:col
            if temp(i,j)==n;
                if(count<5)
                    c(k).clus(i,j)= A1(i,j);
                    temp(i,j)=999;
                    
                else
                    k=k+1;
                    c(k).clus(i,j)=A1(i,j);
                    temp(i,j)=999;
                    count=0;
                   
                end
                
           end
        end
    end
    count=count+1;
    n=n+1;
    
end
 fprintf('The value of k is %i',k);
 fprintf('\n');
return
end

