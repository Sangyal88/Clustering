function [ c1,c2] = Pdistance2(X, c1, c2, k, Ck, ind_i, ind_j, t, min)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
 [row,col] = size(X);
    minVal=int16(min); 
    mindistvalue = 9999; % some arbitrary large value
                    
            for i = 1:row
                for j = 1 :col
                    val = X(i,j);
                    if (Ck ~= val) % only then do the comparision
                        if (ind_i == i ) && (ind_j == j)
                            continue %skip this particular element
                        else % for all other element; process them

                            minVal(i,j) = abs(val - X(ind_i, ind_j));
                            if (mindistvalue > minVal(i,j))
                                mindistvalue = minVal(i,j);
                               %index_i = i;
                                %index_j = j;
                                if (numel(c1)<t)

                            end
                        end
                    end
                end
            end
  
return 

end

