function out=calcSAD(R, C)
% already x, y, i, j, N
out=sum(sum(abs(C-R)));
% [H W ~]=size(R);
% out=0;
% for i=1:H
%     for j=1:W
%         out=out+abs(C(i, j)-R(i, j));
%     end
% end

end