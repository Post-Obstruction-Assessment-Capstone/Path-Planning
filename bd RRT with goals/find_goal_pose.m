function goal_pose = find_goal_pose(map,init_pose)
xlim = max(map.XWorldLimits);
ylim = max(map.YWorldLimits);
i=0;
while i==0
    tmpX = 2+round(xlim*rand);
    tmpY = 2+round(ylim*rand);
    tmp = checkOccupancy(map,[(tmpX),(tmpY)]);
    if tmp==0
        dist = sqrt( (init_pose(1) - tmpX)^2 + (init_pose(2) - tmpY)^2);
        if dist > 100 && dist < 750
            i=1;
        end
    end
end
x = tmpX;
y = tmpY;
goal_pose = [x,y];
end