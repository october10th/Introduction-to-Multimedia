function y=convolution(x, h)
% I don't know why this doesn't match conv in MATLAB
    y=zeros(length(x), 1);
    for n=0:1:length(x)-1
        for k=0:1:length(h)-1
            if n-k<0
                y(n+1)=0;
            else
                y(n+1)=y(n+1)+h(k+1)*x(n-k+1);
            end
        end
    end
end