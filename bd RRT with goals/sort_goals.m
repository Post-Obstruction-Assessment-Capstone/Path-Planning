function [sorted_goals_mat] = sort_goals(goal_pose_mat,init)

numGoals = size(goal_pose_mat,1);

for i=1:numGoals
    dist_mat = sqrt( (goal_pose_mat(:,1) - init(1)).^2 + (goal_pose_mat(:,2) - init(2)).^2 );
    [~,ind] = min(dist_mat);
    sorted_goals_mat(i,:)=goal_pose_mat(ind,:);
    init = goal_pose_mat(ind,:);
    goal_pose_mat(ind,:)=[];
end