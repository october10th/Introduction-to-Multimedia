function out=calcSAD(R, C)
% already x, y, i, j, N
out=sum(sum(abs(C-R)));

end