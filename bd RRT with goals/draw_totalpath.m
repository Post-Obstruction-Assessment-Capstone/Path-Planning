function draw_totalpath(totalpath_cell)

C = {'r','g','b','m','y',[rand rand rand],[rand rand rand],[rand rand rand],[rand rand rand],[rand rand rand],[rand rand rand]};

for j=1:size(totalpath_cell,2)
    totalpath = totalpath_cell{j};
    m = size(totalpath,1);
    hold on
    init = totalpath(1,:);
    goal = totalpath(end,:);
    if j==1
        plot(init(1),init(2),'bx','MarkerSize',30)
    else
%         plot(init(1),init(2),'rx','MarkerSize',30)
    end
    
    if j==size(totalpath_cell,2)
        plot(goal(1),goal(2),'bo','MarkerSize',30)
    else
%         plot(goal(1),goal(2),'rx','MarkerSize',30)
    end
    
    for i=1:m-1
        pt1 = totalpath(i,:);
        pt2 = totalpath(i+1,:);
        ptplot = vertcat(pt1,pt2);
        plot(ptplot(:,1),ptplot(:,2),'-','color',C{j},'LineWidth',2);
    end
end
end
