function alpha=newalpha(k,map,init,goal)
xlim = max(map.XWorldLimits);
ylim = max(map.YWorldLimits);

xrand = xlim*rand;
yrand = ylim*rand;


alpha = [xrand, yrand];

% draw to center of regions
if mod(k,10)==0
    alpha = [(init(1)+goal(1))/2, (init(2)+goal(2))/2,];
end

% if mod(k,9)==0
%     alpha = init;
% end
% 
% if mod(k,11)==0
%     alpha = goal;
% end

end