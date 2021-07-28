function [ Cs, A1 ] = cluster2( Ck,nk,A1,Cs,t,countelement )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[row,col]=size(A1);
x=1;

   for i=1 : row
        for j= 1: col
            val = A1(i, j);
            %while(x<nk-1)
                if (val ~= Ck)
                    [index_i, index_j] = pointdistance(A1, i, j, Ck);
                    Cs(x).c(i, j) = A1(i, j);
                    Cs(x).c(index_i, index_j) = A1(index_i, index_j);

                    A1(index_i,index_j)=Ck;
                    A1(i,j)=Ck;
                    countelement = countelement + 2;
                    fprintf('The value of count=%i',countelement);
                    fprintf('\n');
                    if (countelement >= t) 
                        countelement=0;
                        break;
                    end
                   
                 end
            %end
        end
         
        if (countelement >= t) 
            break; %outer loop
        end
    end

for i=1 : row
    for j= 1: col
        if (A1(i,j) ~= Ck) && (countelement >= t)             
            Cs(nk).c(i,j)=A1(i,j);
            A1(i,j)=Ck;
        end
    end
end


end

