function E = addtoEmat(q_n,q_s,E,V)
indn=findqinV(V,q_n);
inds=findqinV(V,q_s);

E{inds}=indn;

if ~isempty(E{indn})
    tmp = E{indn};
    E{indn} = [tmp, inds];
else
   E{indn} = inds; 
end

end