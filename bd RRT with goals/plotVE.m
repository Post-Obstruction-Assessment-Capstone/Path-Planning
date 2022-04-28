function plotVE(V1,E1,V2,E2,map)
show(map)
hold on
for i=1:size(V1,1)
   tmpedges = E1{i};
   point1 = V1(i,:);
   for j=1:length(tmpedges)
      
      tmppoint = tmpedges(j);
      if tmppoint <= size(V1,1)
        point2 = V1(tmppoint,:);
        A = vertcat(point1,point2);
        plot(A(:,1),A(:,2),'go-')
      end
   end
    
end


for i=1:size(V2,1)
   tmpedges = E2{i};
   point1 = V2(i,:);
   for j=1:length(tmpedges)
      
      tmppoint = tmpedges(j);
      if tmppoint <= size(V2,1)
        point2 = V2(tmppoint,:);
        A = vertcat(point1,point2);
        plot(A(:,1),A(:,2),'ro-')
      end
   end
    
end

end