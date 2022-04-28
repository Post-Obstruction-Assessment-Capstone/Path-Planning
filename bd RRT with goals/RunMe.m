% Bidirectional RRT
clear all
clc
close all
tic
numGoals = 3;

img = imread('imgs/seattle.png');
img_b = imbinarize(img);
map = binaryOccupancyMap(img_b,1);

inflate(map,2)
figure
map = reverseMap(map);
show(map)

init_pose = find_init_pose(map);
goal_pose_mat = find_goal_poses(map,init_pose,numGoals);


goal_pose_mat = sort_goals(goal_pose_mat,init_pose);

goal_pose = goal_pose_mat(1,:);

hold on

maxVsize = 50000;
for j=1:size(goal_pose_mat,1)
    if j>1
        init_pose = goal_pose_mat(j-1,:);
        goal_pose = goal_pose_mat(j,:);
    end
    V1 = init_pose;
    V2 = goal_pose;
    
    parent1 = [1 1];
    parent2 = [1 1];
    
    minnorm=50;
    E1{1}=1;
    E2{1}=1;
    
    for k=1:maxVsize
        if k==maxVsize
            smooth_path_cell = smooth_path(totalpath,map);
            draw_totalpath(smooth_path_cell)
            toc
            return
        end
        alpha = newalpha(k,map,init_pose,goal_pose);
        
        q_n = nearestV(V1,alpha);
        q_s = stoppingConfig(q_n,alpha);
        
        if norm(q_n-q_s,2)>0.01
            tmp = checkCollision(q_s,q_n,map);
            if ~tmp
                V1 = [V1;q_s];
                E1 = addtoEmat(q_n,q_s,E1,V1);
                parent1(end+1,:)=[size(V1,1),findqinV(V1,q_n)];
                
                
                q_n2 = nearestV(V2,q_s);
                q_s2 = stoppingConfig(q_n2,q_s);
                if norm(q_n2-q_s2,2)>0.01
                    tmp2 = checkCollision(q_s2,q_n2,map);
                    if ~tmp2
                        V2 = [V2;q_s2];
                        E2 = addtoEmat(q_n2,q_s2,E2,V2);
                        parent2(end+1,:)=[size(V2,1),findqinV(V2,q_n2)];
                        
                        if norm(q_s2-q_s,2) < minnorm
                            minnorm = norm(q_s2-q_s,2);
                            outtext = ['min dist from q_s'' to q_s: ',num2str(minnorm)];
                            disp(outtext)
                        end
                        if norm(q_s2-q_s,2)<0.5
                            disp('success')
                            
                            show(map)
                            hold on
                            path1=findpath(parent1,V1);
                            path2=findpath(parent2,V2);
                            %                             plotVE(V1,E1,V2,E2,map)
                            totalpath{j} = find_totalpath(path1,path2,init_pose,goal_pose);
                            if j<numGoals
                                break
                            else
                                smooth_path_cell = smooth_path(totalpath,map);
                                draw_totalpath(smooth_path_cell)
                                toc
                                return
                            end
                        end
                    end
                end
            end
        end
        
        
        tmpV1 = V1;
        tmpE1 = E1;
        tmpP1 = parent1;
        
        V1 = V2;
        E1 = E2;
        V2 = tmpV1;
        E2 = tmpE1;
        
        parent1 = parent2;
        parent2 = tmpP1;
    end
    
    clear E1
    clear E2
    
end

toc
