function out=ErrorDiffDither(input, mask)
[H, W, ~]=size(input);
[h, w, ~]=size(mask);
fw=floor(w/2);
half=im2double([uint8(128)]);
out=input;

for i=1:H
    for j=1:W
        if out(i, j)<half
            e=out(i, j);
            out(i, j)=0;
        else
            e=out(i, j)-1;
            out(i, j)=1;
        end
        if j-fw>0
            sw=j-fw;
            ssw=1;
        else
            sw=j;
            ssw=fw+1;
        end
        
        if j+fw>W
            ew=W;
        else
            ew=j+fw;
        end
        
        if i+h-1>H, eh=H;
        else eh=i+h-1;
        end
        out(i:eh, sw:ew)=out(i:eh, sw:ew)+e*mask(1:eh-i+1, ssw:ssw+(ew-sw));
    end

end