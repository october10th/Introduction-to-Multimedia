function out=BI(input, N)
[H, W, ~]=size(input);
out=zeros(N*H, N*W);
for i=1:N*H
    for j=1:N*W
        x=floor((i+1)/N);
        y=floor((j+1)/N);
        u=double((i+1)/N-floor((i+1)/N));
        t=double((j+1)/N-floor((j+1)/N));
        if x>0&&x<H&&y>0&&y<W
        out(i, j)=(1-u)*(1-t)*input(x, y)+...
                    u*(1-t)*input(x+1, y)+...
                    (1-u)*t*input(x, y+1)+...
                    u*t*input(x+1, y+1);
        else
            out(i, j)=input(round((i+1)/N), round((j+1)/N));
            
        end
    end
end
end