%%
[img_BFCat, map_BFCat, alpha_BFCat] = imread('data/BFCatvengers.png');
[img_BF, map_BF, alpha_BF] = imread('data/BayerFilter.BMP');
[img_Cat, map_Cat, alpha_Cat] = imread('data/Catvengers.png');
img_BFCat=im2double(img_BFCat);
img_BF=im2double(img_BF);
img_Cat=im2double(img_Cat);
%%
[H, W, ~]=size(img_BFCat);

img_RecCat=zeros([H, W, 3]);
for i=2:H-1
    for j=2:W-1
        for k=1:3
            if img_BF(i, j, k)==1
                img_RecCat(i, j, k)=img_BFCat(i, j, k);
            else
                img_RecCat(i, j, k)=...
                    sum(sum(img_BF(i-1:i+1, j-1:j+1, k).*...
                img_BFCat(i-1:i+1, j-1:j+1, k)))/...
                sum(sum(img_BF(i-1:i+1, j-1:j+1, k)));
            end
            
        end
    end
end



%%
% [peaksnr,snr] = psnr(img_RecCat, img_Cat)
peaksnr=PSNR(img_RecCat, img_Cat)
%%
img_absDiff=abs(img_RecCat-img_Cat);
%%
subplot(1, 4, 1);
imshow(img_BFCat);
title('BFCatvengers.png');

subplot(1, 4, 2);
imshow(img_RecCat);
title('result of 1.(a)');

subplot(1, 4, 3);
imshow(img_Cat);
title('Catvengers.png');

subplot(1, 4, 4);
imshow(img_absDiff);
title('absoulte color difference');
%%
imwrite(img_RecCat, 'output/hw1_1a.png');
imwrite(img_absDiff, 'output/hw1_1a_absDiff.png');