function [ c1,c2, A1 ] = cluster( Ck,A1,c1,c2,t,countelement )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[row,col]=size(A1);
for i=1 : row
    for j= 1: col
        val = A1(i, j);
        if (val ~= Ck)
            [index_i, index_j] = pointdistance(A1, i, j, Ck);
            c1(i, j) = A1(i, j);
            c1(index_i, index_j) = A1(index_i, index_j);
            
            A1(index_i,index_j)=Ck;
            A1(i,j)=Ck;
            countelement = countelement + 2;
            if (countelement >= t) 
                break;
            end
        end
    end
    if (countelement >= t) 
        break; %outer loop
    end
end

for i=1 : row
    for j= 1: col
        if (A1(i,j) ~= Ck) && (countelement >= t)             
            c2(i,j)=A1(i,j);
            A1(i,j)=Ck;
        end
    end
end

end

