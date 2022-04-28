function map = reverseMap(map)
xlim = max(map.XWorldLimits);
ylim = max(map.YWorldLimits);
yvec = 0:ylim;
for i=0:xlim
    xvec = i*ones(1,length(yvec));
    tmp = getOccupancy(map,[xvec' yvec']);
    setOccupancy(map,[xvec' yvec'],~tmp);
end