function [ temp, h, l ] = pointdistance(X)
%function [mindistvalue, index_i, index_j] = pointdistance(X, ind_i, ind_j, Ck)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [row, col] = size(X);
    temp= X(row,col);
%minVal=zeros(row, col)+Ck;% Initialize constant value 999 to all elements
%mindistvalue = 9999; % some arbitrary large value
for i = 1:row
    for j = 1 : col
        val = X(i,j);
        %if (Ck ~= val) % only then do the comparision
            %if ind_i == i  && ind_j == j
                %continue %skip this particular element
            %else % for all other element; process them
                diffValue = abs(val - X(1, 1));
                temp(i,j) = diffValue;
           % end
        %end
    end
end
high = max(temp);
h = max(high);
lowest = min(temp);
l = min(lowest);
return
end


