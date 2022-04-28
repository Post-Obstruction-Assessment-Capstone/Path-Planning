function ind=findqinV(V,q)
distmat = abs(V(:,1) - q(1)) + abs(V(:,2) - q(2));
[~, ind] = min(distmat);
end