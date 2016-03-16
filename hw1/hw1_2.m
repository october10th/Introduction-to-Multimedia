%%
[img_lena, map_lena, alpha_lena] = imread('data/lena_gray.bmp');
[img_shizuma, map_shizuma, alpha_shizuma] = imread('shizuma.jpg');
img_shizuma=rgb2gray(img_shizuma);
%%
img_lena_thresh128=ThresholdDither(img_lena, 128);
img_lena=im2double(img_lena);
img_lena_threshavg=ThresholdDither(img_lena, mean(mean(img_lena)));
%%
img_shizuma_thresh128=ThresholdDither(img_shizuma, 128);
img_shizuma=im2double(img_shizuma);
img_shizuma_threshavg=ThresholdDither(img_shizuma, mean(mean(img_shizuma)));
%%
mask1=[0 0 7; 3 5 1];
mask1=mask1/16;
mask2=[0 0 0 7 5; 3 5 7 5 3; 1 3 5 3 1];
mask2=mask2/48;
%%
img_lena_error1=ErrorDiffDither(img_lena, mask1);
img_lena_error2=ErrorDiffDither(img_lena, mask2);
%%
img_shizuma_error1=ErrorDiffDither(img_shizuma, mask1);
img_shizuma_error2=ErrorDiffDither(img_shizuma, mask2);
%% 2-a
subplot(2, 5, 1);
imshow(img_lena);
title('original image');
subplot(2, 5, 2);
imshow(img_lena_thresh128);
title('threshold 128(choose)');
subplot(2, 5, 3);
imshow(img_lena_threshavg);
title('threshold average');
subplot(2, 5, 6);
imshow(img_shizuma);
title('original image');
subplot(2, 5, 7);
imshow(img_shizuma_thresh128);
title('threshold 128(choose)');
subplot(2, 5, 8);
imshow(img_shizuma_threshavg);
title('threshold average');

%% 2-b
subplot(2, 5, 4);
imshow(img_lena_error1);
title('2.b.mask 1');
subplot(2, 5, 5);
imshow(img_lena_error2);
title('2.b.mask 2(choose)');
subplot(2, 5, 9);
imshow(img_shizuma_error1);
title('2.b.mask 1');
subplot(2, 5, 10);
imshow(img_shizuma_error2);
title('2.b.mask 2(choose)');
%%
imwrite(img_lena_thresh128, 'output/hw1_2a_lena_128.png');
imwrite(img_lena_threshavg, 'output/hw1_2a_lena_avg.png');
imwrite(img_lena_error1, 'output/hw1_2b_lena_error1.png');
imwrite(img_lena_error2, 'output/hw1_2b_lena_error2.png');

imwrite(img_shizuma, 'output/hw1_2a_shizuma_gray.png');
imwrite(img_shizuma_thresh128, 'output/hw1_2a_shizuma_128.png');
imwrite(img_shizuma_threshavg, 'output/hw1_2a_shizuma_avg.png');
imwrite(img_shizuma_error1, 'output/hw1_2b_shizuma_error1.png');
imwrite(img_shizuma_error2, 'output/hw1_2b_shizuma_error2.png');