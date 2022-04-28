function init_pose = find_init_pose(map)
xlim = max(map.XWorldLimits);
ylim = max(map.YWorldLimits);
stop = 0;
while stop==0
    tmpX = 2+round(1000*rand);
    tmpY = 2+round(ylim*rand);
    occ=checkOccupancy(map,[tmpX,tmpY]);
    if occ==0
        init_pose = [tmpX,tmpY];
        stop=1;
    end
end
end