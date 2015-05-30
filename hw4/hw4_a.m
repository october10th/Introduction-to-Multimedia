[img_ref, map_ref, alpha_ref] = imread('caltrain007.bmp');
img_ref=im2double(img_ref);
img_ref=rgb2gray(img_ref);

%% full
for fileidx=[8 17]
    str1='caltrain0';
    str2='.bmp';
    if fileidx<10
        filename=[str1 '0' num2str(fileidx) str2];
    else
        filename=[str1 num2str(fileidx) str2];
    end
    [img_target, map_target, alpha_target] = imread(filename);
    img_target=im2double(img_target);
    img_target=rgb2gray(img_target);
    for N=[8 16]
        for d=[8 16]
            disp(['full search ' filename ' (N=' num2str(N) ', d=' num2str(d) ')']);
            tic
            [motion totalSAD]=fullSearch(img_ref, img_target, d, N);
            img_predict=getPredict(img_ref, motion, N);
            disp(['total SAD = ' num2str(totalSAD)]);
            toc
%             psnr(img_target, img_predict);
            imwrite(abs(img_predict-img_target), ['hw4_a_fullsearch_N_' num2str(N) '_d_' num2str(d) '_' filename]);
        end

    end
end

%% logarithm
for fileidx=[8 17]
    str1='caltrain0';
    str2='.bmp';
    if fileidx<10
        filename=[str1 '0' num2str(fileidx) str2];
    else
        filename=[str1 num2str(fileidx) str2];
    end
    [img_target, map_target, alpha_target] = imread(filename);
    img_target=im2double(img_target);
    img_target=rgb2gray(img_target);
    for N=[8 16]
        for d=[8 16]
            disp(['2D logarithmic search ' filename ' (N=' num2str(N) ', d=' num2str(d) ')']);
            tic
            [motion totalSAD]=logSearch(img_ref, img_target, d, N);
            img_predict=getPredict(img_ref, motion, N);
            disp(['total SAD = ' num2str(totalSAD)]);
            toc
%             psnr(img_target, img_predict)%
            imwrite(abs(img_predict-img_target), ['hw4_a_logsearch_N_' num2str(N) '_d_' num2str(d) '_' filename]);
        end

    end
end
