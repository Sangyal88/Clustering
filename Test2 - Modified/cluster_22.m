
function [ c, temp, k , cen] = cluster_22( l, h, temp, A1, nk)
    %UNTITLED Summary of this function goes here
    % Sir, please describe the function
    %   Detailed explanation goes here
    [row,col] = size(temp);
    for i=1: nk
        c(i).clus = zeros(row,col);
        c(i).clus(:)= 555;
        c(i).clus = int32(c(i).clus);
        cen(i)= 0;%centroid
        cen(i)= int32(cen(i));
        %c(i).centroid = int32(c(i).centroid);
    end
    k=1;
    n=l;
    groupSize = ceil((h-l)/(nk-1));
    fprintf('The value of grpsize is %i', groupSize);
    count=0;
   % c().centroid =0;%centroid
   
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
        %cen(k)=int16(sum(c(k).clus(:))/nnz(c(k).clus(:)));
    end
    for k=1:nk
       cen(k)=int16(sum(c(k).clus(:))/nnz(c(k).clus(:))); 
    end
     %fprintf('The value of k is %i', k);
     fprintf('\n');
    return
end

