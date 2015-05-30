function [out, totalSAD]=fullSearch(ref, tar, d, N)
% d:search range
% N:macro block
[H W ~]=size(ref);
out=zeros(H/N, W/N, 2);
totalSAD=0;
for i=1:N:H
    for j=1:N:W
        idx_x=floor((i-1)/N)+1;
        idx_y=floor((j-1)/N)+1;
        SAD=1e9;
        out(idx_x, idx_y, 1)=0;
        out(idx_x, idx_y, 2)=0;
        for a=max(i-d, 1):1:min(i+d, H)
            for b=max(j-d, 1):1:min(j+d, W)
                if i+N-1>H || j+N-1>W || a+N-1>H || b+N-1>W
                    continue;
                end
                
                nowSAD=calcSAD(ref(i:i+N-1, j:j+N-1), tar(a:a+N-1, b:b+N-1));
                if nowSAD<SAD
                    SAD=nowSAD;
                    
                    out(idx_x, idx_y, 1)=a-i;
                    out(idx_x, idx_y, 2)=b-j;
                end
            end
        end
        totalSAD=totalSAD+SAD;
        
    end
end


end