function totalpath = drawpath(path1,path2,init,goal)

A = ismember(path1,init,"rows");
tmp = max(A);

B = ismember(path2,init,"rows");
tmp2 = max(B);

% Construct total path
if tmp == 1
    if A(end)==1
        totalpath = [flip(path1);path2];
    elseif A(1)==1
        totalpath = [path1;path2];
    end
elseif tmp2 == 1
    if B(end)==1
        totalpath = [flip(path2);path1];
    elseif B(1)==1
        totalpath = [path2;path1];
    end
end

% if ~isempty(tmp)
%     if tmp == length(path1)
%         totalpath = [flip(path1);path2];
%     else
%         totalpath = [path1;path2];
%     end
% else
%     if tmp2 == length(path2)
%         totalpath = [flip(path2);path1];
%     else
%         totalpath = [path2;path1];
%     end
% end

% totalpath = [path1;flip(path2)];
    

m = size(totalpath,1);
hold on
plot(init(1),init(2),'bx','MarkerSize',10)
plot(goal(1),goal(2),'rx','MarkerSize',10)

for i=1:m-1
    pt1 = totalpath(i,:);
    pt2 = totalpath(i+1,:);
    ptplot = vertcat(pt1,pt2);
    plot(ptplot(:,1),ptplot(:,2),'b-','LineWidth',2);
end


% end


end