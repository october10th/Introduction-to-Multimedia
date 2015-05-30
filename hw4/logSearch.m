function [out, totalSAD]=logSearch(ref, tar, d, N)

% d:search range
% N:macro block
[H W ~]=size(ref);
out=zeros(H/N, W/N, 2);
totalSAD=0;
for i=1:N:H
    for j=1:N:W
        
        idx_x=floor((i-1)/N)+1;
        idx_y=floor((j-1)/N)+1;
        used=zeros(H, W);
        n=floor(log2(d));
        n=max(2, 2^(n-1));
        % start center
        cur_x=i;
        cur_y=j;
        SAD=calcSAD(ref(cur_x:cur_x+N-1, cur_y:cur_y+N-1), tar(cur_x:cur_x+N-1, cur_y:cur_y+N-1));
        out(idx_x, idx_y, 1)=0;
        out(idx_x, idx_y, 2)=0;
        used(cur_x, cur_y)=1;
        while n>0
            move_x=cur_x;
            move_y=cur_y;
            if n==1
                mv=[1 0; 0 1; -1 0; 0 -1; 1 -1; 1 1; -1 -1; -1 1];
                
            else
                mv=[1 0; 0 1;-1 0;0 -1];
            end
            for d=1:size(mv, 1)
                dx=n*mv(d, 1);
                dy=n*mv(d, 2);
                tar_x=cur_x+dx;
                tar_y=cur_y+dy;
                if tar_x<1 || tar_y<1 || tar_x+N-1>H || tar_y+N-1>W
                    continue;
                end
                if tar_x<i-d || tar_x>i+d || tar_y<j-d || tar_y>j+d
                    
                    continue;
                end
                if  used(tar_x, tar_y)==1
                    continue;
                end
                used(tar_x, tar_y)=1;
                nowSAD=calcSAD(ref(i:i+N-1, j:j+N-1),...
                               tar(tar_x:tar_x+N-1, tar_y:tar_y+N-1));
                if nowSAD<SAD
                    SAD=nowSAD;
                    move_x=tar_x;
                    move_y=tar_y;
                end
            end
            if move_x==cur_x && move_y==cur_y
                n=floor(n/2);
            else
                cur_x=move_x;
                cur_y=move_y;
            end

        end
        
        totalSAD=totalSAD+SAD;
        out(idx_x, idx_y, 1)=move_x-i;
        out(idx_x, idx_y, 2)=move_y-j;
    end
    
end


end