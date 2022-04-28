function q_s = stoppingConfig(q_n,alpha)
extendby = 4;
disp = alpha-q_n;


dispnorm = disp/norm(disp,2);
q_s = extendby*dispnorm + q_n;


end