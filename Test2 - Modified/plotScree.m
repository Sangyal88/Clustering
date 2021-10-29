function wss = plotScree(X, n, h, l, temp)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%X=double(X1);
wss = zeros(1, n);
wss(1) = (size(X, 1)-1) * sum(var(X, [], 1));
for i=2:n
    %T = clusterdata(X,'maxclust',i);
    T = cluster_2( l, h, temp, X, i);
    wss(i) = sum((grpstats(T, T, 'numel')-1) .* sum(grpstats(X, T, 'var'), 2));
end
hold on
plot(wss)
plot(wss, '.')
xlabel('Number of clusters')
ylabel('Within-cluster sum-of-squares')

end

