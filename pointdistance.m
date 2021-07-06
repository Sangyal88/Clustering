function [mindistvalue, index_i, index_j] = pointdistance(X, ind_i, ind_j, Ck)
%===================================================================
% Point Distance with Matrix, Version 1.0
% Copyright(c) 2021 Amit Gurung and Sangyal Lama Tamang
% All Rights Reserved.
%
% ----------------------------------------------------------------------
% Permission to use, copy, or modify this software and its documentation
% for educational and research purposes only and without fee is here
% granted, provided that this copyright notice and the original authors'
% names appear on all copies and supporting documentation. This program
% shall not be used, rewritten, or adapted as the basis of a commercial
% software or hardware product without first obtaining permission of the
% authors. The authors make no representations about the suitability of
% this software for any purpose. It is provided "as is" without express
% or implied warranty.
%----------------------------------------------------------------------
% 
%%Function to compute minimum distance of an element in the Matrix X, the
%element with which the distance to be computed is given by the index
%(ind_i, ind_j) of the same matrix X. On return the function returns the
%minimum distance value as mindistvalue and the corresponding minimum
%distance element in the Matrix M is given by the indices (index_i,index_j)
%Note: The comparing process skips an element in the Matrix X, when the
%element has a special-constant value say Ck=999. Moreover, the element 
%formed by the indices (ind_i, ind_j) also to be skipped in the comparison. 

%[mindistvalue, index_i, index_j] = pointdistance(X,ind_i, ind_j, Ck)
%X=int16(X);
%A=double(X);
[row,col] = size(X);
mindistvalue = 9999; % some arbitrary large value
for i = 1:row
    for j = 1 : col
        val = X(i,j);
        if (Ck ~= val) % only then do the comparision
            if (ind_i == i ) && (ind_j == j)
                continue %skip this particular element
            else % for all other element; process them
                minVal = abs(val - X(ind_i, ind_j));
                if (mindistvalue > minVal)
                    mindistvalue = minVal;
                    index_i = i;
                    index_j = j;
                end
            end
        end
    end
end
return
