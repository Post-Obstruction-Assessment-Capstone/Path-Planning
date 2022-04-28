function output = cost(q_s,q_n)
output = abs(q_s(1)-q_n(1))+abs(q_s(2)-q_n(2))+abs(q_s(3)-q_n(3));
end