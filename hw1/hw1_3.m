%%
[img_Cat, map_Cat, alpha_Cat] = imread('data/Catvengers_gray.png');
img_Cat=im2double(img_Cat);

%%
img_Cat_NN=NNI(img_Cat, 4);

%%
img_Cat_B=BI(img_Cat, 4);

%%

subplot(1, 3, 1);
imshow(img_Cat);
title('original');
subplot(1, 3, 2);
imshow(img_Cat_NN);
title('3.a NN');
subplot(1, 3, 3);
imshow(img_Cat_B);
title('3.b B');
%%
imwrite(img_Cat_NN, 'output/hw1_3a_img_Cat_NN.png');
imwrite(img_Cat_B, 'output/hw1_3b_img_Cat_B.png');