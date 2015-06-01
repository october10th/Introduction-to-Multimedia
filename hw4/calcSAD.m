function [out, ti]=calcSAD(R, C)
% already x, y, i, j, N
start_SAD=tic;
out=sum(sum(abs(C-R)));
ti=toc(start_SAD);
% [H W ~]=size(R);
% out=0;
% for i=1:H
%     for j=1:W
%         out=out+abs(C(i, j)-R(i, j));
%     end
% end

end