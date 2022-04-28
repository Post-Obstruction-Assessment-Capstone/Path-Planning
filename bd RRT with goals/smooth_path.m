function smooth_path_cell = smooth_path(totalpath_cell,map)
numGoals = size(totalpath_cell,2);

for i=1:numGoals
    tmp_path_full = totalpath_cell{i};
    path_len = size(tmp_path_full,1);
    tmp_path=[];

    j=0;
    start_ind = 1;
    end_ind = path_len;

    while j==0 % For each path...


        p=0;
        count = 1;
        while p == 0 % Find longest obstacle free path from



            ind = check_intermediate_pts(tmp_path_full(start_ind,:), tmp_path_full(end_ind,:),map);

            if ~ind

                tmp1 = size(tmp_path,1);
                if tmp1 == 0
                    tmp_path(1,:) = tmp_path_full(start_ind,:);
                    tmp_path(2,:) = tmp_path_full(end_ind,:);
                    start_ind = end_ind;
                    end_ind = path_len;
                else
                    %                     tmp_path(end+1,:) = tmp_path_full(start_ind,:);
                    tmp_path(end+1,:) = tmp_path_full(end_ind,:);
                    start_ind = end_ind;
                    end_ind = path_len;
                end
            else
                end_ind = end_ind - 1;
            end

            count = count + 1;

            if start_ind >= end_ind
                p=1;

            end
        end
        if size(tmp_path,1)>0
            if tmp_path(end,1) == tmp_path_full(end,1) && tmp_path(end,2) == tmp_path_full(end,2)
                j=1;
            else
                start_ind = start_ind+1;
                end_ind = path_len;
                tmp_path;
            end

        end
    end
    smooth_path_cell{i} = tmp_path;




end


end
