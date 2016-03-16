function out=PSNR(K, I)
% I: original image
% K: the result of a.
[H, W, P]=size(K);
MSE=(I-K).^2;
MAX=1;
for i=1:P
    MSE=sum(MSE);
end
%%
% MSE=sum(sum(sum((I-K).^2)));

%%
MSE=MSE/P/W/H;
out=20*log10(MAX)-10*log10(MSE);
end