function [q_best,q_neighbors] = findNeighbors(V,E,q_s,R)
distmat = abs(V(:,1)-q_s(1))+abs(V(:,2)-q_s(2))+abs(V(:,3)-q_s(3));
tmp = find(distmat < R);
if ~isempty(tmp)
    for i=1:length(tmp)
        q_neighbors(i) = [V(tmp(i),1:6), cost(V(tmp(i),1:3),q_s)];
    end
    [~, ind] = min(q_neighbors(:,end));
    q_best = q_neighbors(ind,:);
end
end