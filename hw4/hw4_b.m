[img_ref, map_ref, alpha_ref] = imread('caltrain007.bmp');
img_ref=im2double(img_ref);
img_ref=rgb2gray(img_ref);

%%
psnrValF=zeros(10, 2, 2);
psnrValL=zeros(10, 2, 2);
for i=8:17
    str1='caltrain0';
    str2='.bmp';
    if i<10
        filename=[str1 '0' num2str(i) str2];
    else
        filename=[str1 num2str(i) str2];
    end
    [img_target, map_target, alpha_target] = imread(filename);
    img_target=im2double(img_target);
    img_target=rgb2gray(img_target);
    for N=[8 16]
        for d=[8 16]
            [motion totalSAD]=fullSearch(img_ref, img_target, d, N);
            img_predict=getPredict(img_ref, motion, N);
            
            psnrValF(i-7, N/8, d/8)=psnr(img_target, img_predict);
            
            [motion totalSAD]=logSearch(img_ref, img_target, d, N);
            img_predict=getPredict(img_ref, motion, N);
            
            psnrValL(i-7, N/8, d/8)=psnr(img_target, img_predict);
%           imwrite(abs(img_predict-img_target), ['hw4_a_fullsearch_N_' num2str(N) '_d_' num2str(d) filename]);
        end

    end

end

%%
x=8:1:17;
for i=1:2
    for j=1:2
        N=8*i;
        d=8*j;
        subplot(2, 2, (i-1)*2+j);

        y1=psnrValF(:, i, j);
        y2=psnrValL(:, i, j);
        plot(x, y1', 'r-o',x, y2', 'b-o');
        title(['N=' num2str(N) ', d=' num2str(d)]);
        xlabel('target frame');
        ylabel('psnr');
    end
end