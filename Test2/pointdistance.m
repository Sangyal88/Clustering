function [ temp, h, l ] = pointdistance(X)
    %UNTITLED Summary of this function goes here
    % Sir, please describe the function
    %   Detailed explanation goes here
    [row, col] = size(X);
    temp= X(row,col);
    for i = 1:row
        for j = 1 : col
            val = X(i,j);
            diffValue = abs(val - X(1, 1));
            temp(i,j) = diffValue;
         end
    end
    high = max(temp);
    h = max(high);
    h
    lowest = min(temp);
    l = min(lowest);
    l
    return
end


