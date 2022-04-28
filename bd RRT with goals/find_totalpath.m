function totalpath = find_totalpath(path1,path2,init,goal)

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


end
