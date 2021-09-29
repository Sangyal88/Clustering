


function [ c, temp ] = cluster_2( l, h, temp, A1, nk)
    %UNTITLED Summary of this function goes here
    % Sir, please describe the function
    %   Detailed explanation goes here
    [row,col] = size(temp);
    
    c(1).clus = zeros(row,col);
    
    k=1;
    n=l;
    groupSize = ceil((h-l)/(nk-1));
    
    count=0;
    c().centroid =0;%centroid
    while(n<h+1)

        for i=1:row
            for j=1:col
                if temp(i,j)==n  
                    if(count < groupSize)
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
        c(k).centroid=int16(sum(c(k).clus(:))/nnz(c(k).clus(:)));
    end
     fprintf('The value of k is %i',k);
     fprintf('\n');
    return
end

