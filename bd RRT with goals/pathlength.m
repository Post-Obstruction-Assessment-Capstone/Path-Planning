function dist=pathlength(path,path2)
dist = 0;
for i=1:length(path)-1
    pt1 = path(i,1:3);
    pt2 = path(i+1,1:3);
    dist = dist + norm(pt2-pt1,2);
end

for i=1:length(path2)-1
    pt1 = path2(i,1:3);
    pt2 = path2(i+1,1:3);
    dist = dist + norm(pt2-pt1,2);
end


end