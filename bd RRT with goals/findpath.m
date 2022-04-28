function path=findpath(parent,V)

pathfound = 0;
ind = parent(end,1);
i=1;
while pathfound == 0
    if ind==1
        disp('path found')
        path(i,:)=V(ind,:);
        pathfound=1;
    end
    path(i,:)=V(ind,:);
    tmpind = find(parent(:,1)==ind);
    ind = parent(tmpind,2);
    i=i+1;
end
end