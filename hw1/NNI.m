function out=NNI(input, N)
% makes sense when N>2
[H, W, ~]=size(input);
out=zeros(N*H, N*W);
for i=1:N*H
    for j=1:N*W
        out(i, j)=input(round((i+1)/N), round((j+1)/N));
    end
end

end