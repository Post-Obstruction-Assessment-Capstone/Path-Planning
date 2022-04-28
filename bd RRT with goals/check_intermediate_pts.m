function ind = check_intermediate_pts(p1,p2,map)
res=2*round(sqrt( (p1(1) - p2(1))^2 + (p1(2) - p2(2))^2));
xstp = linspace(0,(p2(1)-p1(1)),res);
ystp = linspace(0,(p2(2)-p1(2)),res);

ind=0;
ind_mat = zeros(res,1);
p_mat = zeros(res,2);
if res>0
    for i=1:res
        p_mat(i,:) = [p1(1)+xstp(i),p1(2)+ystp(i)];
        ind_mat(i)=checkOccupancy(map,p_mat(i,:));
    end
    ind = max(ind_mat);
end



end
