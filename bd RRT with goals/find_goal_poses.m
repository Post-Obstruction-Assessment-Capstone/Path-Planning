function goal_pose_mat = find_goal_poses(map,init_pose,numGoals)
xlim = max(map.XWorldLimits);
ylim = max(map.YWorldLimits);

for j=1:numGoals
    i=0;
    while i==0
        tmpX = 2+round(xlim*rand);
        tmpY = 2+round(ylim*rand);
        tmp = checkOccupancy(map,[(tmpX),(tmpY)]);
        if tmp==0
            dist = sqrt( (init_pose(1) - tmpX)^2 + (init_pose(2) - tmpY)^2);
            if dist > 100 && dist < 300
                i=1;
            end
        end
    end
    x = tmpX;
    y = tmpY;
    goal_pose_mat(j,:) = [x,y];
end

end