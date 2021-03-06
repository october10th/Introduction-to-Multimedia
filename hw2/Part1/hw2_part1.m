clear all; close all; clc;
darkFigure();
catImage = im2double(imread('github_icon.png'));
[h, w, ~] = size(catImage);
imshow(catImage);

%% Mouse input
xlabel ('Select at most 200 points along the outline', 'FontName', '�L�n������', 'FontSize', 14);
[ ctrlPointX, ctrlPointY ] = ginput(200);
ctrlPointList = [ctrlPointX ctrlPointY];
clickedN = size(ctrlPointList,1);

promptStr = sprintf('%d points selected', clickedN);
xlabel (promptStr, 'FontName', '�L�n������', 'FontSize', 14);

%% Calculate B����zier curve (Your efforts here)

%% sampling rate = 85
% ctrlPointList =[
%    64.6017   62.1598;
%    74.7766   63.3808;
%    82.1025   66.6367;
%    86.9865   69.4857;
%    92.2774   72.3347;
%    97.9754   75.9976;
%   107.7432   73.5556;
%   117.9181   72.3347;
%   128.5000   71.5207;
%   137.4539   71.9277;
%   147.6288   72.7417;
%   154.5477   74.7766;
%   160.2456   75.9976;
%   165.5366   71.5207;
%   170.8275   69.4857;
%   176.5254   66.6367;
%   181.8164   64.6017;
%   187.5143   63.7878;
%   192.8052   62.1598;
%   196.0612   67.4507;
%   197.2822   72.7417;
%   198.0962   80.0676;
%   197.6892   84.9515;
%   196.8752   90.2424;
%   195.6542   95.1264;
%   198.9102  100.0103;
%   202.9801  106.5223;
%   206.2361  111.8132;
%   207.4571  119.9531;
%   207.8641  128.5000;
%   207.0501  140.7099;
%   205.4221  148.8498;
%   203.7941  154.9547;
%   201.7591  162.2806;
%   198.0962  167.1645;
%   194.0262  171.2345;
%   188.7353  175.7114;
%   185.4793  178.9674;
%   176.9324  183.4444;
%   172.0485  186.2933;
%   164.3156  187.1073;
%   159.0246  189.1423;
%   149.6638  189.1423;
%   153.7337  192.8052;
%   158.6176  199.3172;
%   160.2456  206.6431;
%   161.0596  214.7830;
%   160.6526  223.3299;
%   160.2456  229.8418;
%   151.2917  230.2488;
%   141.9308  230.2488;
%   131.7560  229.8418;
%   123.2091  230.2488;
%   109.7782  230.2488;
%    95.9404  230.2488;
%    95.9404  222.5159;
%    97.5684  213.5620;
%    97.9754  205.4221;
%   100.4173  199.7242;
%   102.8593  194.4332;
%   106.1153  191.1773;
%   107.3362  190.3633;
%    96.3474  188.7353;
%    86.1725  185.8863;
%    78.4396  182.2234;
%    69.8927  178.1534;
%    66.2297  173.6765;
%    61.7528  169.6065;
%    58.9038  165.9436;
%    55.2409  158.2107;
%    52.7989  148.8498;
%    51.5779  145.5938;
%    51.1709  139.4889;
%    50.7639  132.9769;
%    51.1709  124.0231;
%    51.5779  116.2901;
%    54.4269  110.1852;
%    56.4618  104.8943;
%    59.3108   99.6033;
%    62.5668   95.9404;
%    60.5318   89.0215;
%    60.5318   82.9165;
%    60.9388   76.4046;
%    61.7528   71.1137;
%    63.3808   67.8577];

%% sampling rate=47
% ctrlPointList =[
% 
%    64.1948   63.3808;
%    75.5906   63.7878;
%    81.6955   66.2297;
%    97.9754   75.5906;
%   111.4062   73.1486;
%   130.5350   71.9277;
%   145.5938   72.7417;
%   159.4316   75.1836;
%   169.6065   69.8927;
%   180.1884   65.0087;
%   193.2122   62.5668;
%   196.4682   71.5207;
%   197.6892   85.7655;
%   195.6542   95.9404;
%   203.7941  108.5572;
%   207.4571  123.2091;
%   206.6431  143.5588;
%   203.7941  155.3617;
%   197.2822  168.3855;
%   185.4793  179.3744;
%   172.0485  185.0723;
%   159.8386  188.7353;
%   151.2917  189.9563;
%   156.9897  196.8752;
%   160.2456  203.3871;
%   160.6526  213.9690;
%   160.6526  220.4809;
%   160.6526  229.4348;
%   140.7099  229.8418;
%   124.4300  229.4348;
%   110.1852  229.8418;
%    97.5684  229.8418;
%    97.5684  215.5970;
%    98.7893  202.9801;
%   102.8593  194.8402;
%   107.7432  189.9563;
%    89.4285  187.5143;
%    76.4046  181.8164;
%    66.2297  174.8975;
%    58.0898  163.0946;
%    51.9849  147.2218;
%    49.9499  128.9070;
%    52.3919  114.6622;
%    58.0898  100.8243;
%    63.3808   95.9404;
%    61.3458   84.5445;
%    61.3458   72.3347];
%% 70
% ctrlPointList =[
% 
%    65.0087   62.5668;
%    74.3696   63.3808;
%    85.7655   68.2647;
%    91.8704   71.5207;
%    97.5684   76.4046;
%   107.3362   73.9626;
%   120.7671   71.5207;
%   129.3140   71.5207;
%   143.5588   71.5207;
%   154.5477   73.9626;
%   159.8386   75.9976;
%   167.5715   71.5207;
%   177.7464   65.8227;
%   186.2933   63.3808;
%   193.2122   62.5668;
%   196.4682   70.7067;
%   197.6892   77.2186;
%   197.6892   84.1375;
%   197.2822   90.2424;
%   195.6542   95.1264;
%   200.5382  101.6383;
%   204.6081  108.9642;
%   206.6431  116.6971;
%   207.8641  128.0930;
%   207.4571  138.2679;
%   205.8291  148.4428;
%   202.5731  157.3967;
%   197.6892  166.7576;
%   191.9913  174.4905;
%   184.6653  179.7814;
%   172.0485  185.4793;
%   162.6876  187.9213;
%   156.1757  188.7353;
%   150.4777  189.9563;
%   156.9897  196.4682;
%   159.8386  203.3871;
%   160.2456  209.0851;
%   160.6526  222.5159;
%   159.8386  229.8418;
%   150.4777  229.8418;
%   133.3839  229.8418;
%   113.8482  229.8418;
%   100.8243  229.8418;
%    97.1614  229.8418;
%    97.5684  224.1439;
%    97.9754  214.7830;
%    97.9754  206.6431;
%    98.7893  200.1312;
%   102.4523  195.2472;
%   105.3013  191.1773;
%   107.3362  189.5493;
%    97.9754  188.3283;
%    84.9515  185.4793;
%    75.9976  181.4094;
%    67.0437  174.8975;
%    61.3458  169.1995;
%    56.8688  161.8736;
%    54.4269  154.9547;
%    52.3919  148.4428;
%    51.1709  139.0819;
%    50.3569  127.2790;
%    50.7639  120.3601;
%    52.7989  112.2202;
%    55.2409  105.7083;
%    58.0898  100.4173;
%    62.5668   97.1614;
%    62.1598   95.5334;
%    60.9388   88.6145;
%    60.5318   84.1375;
%    60.5318   77.6256;
%    62.5668   69.8927
% ];
%%  calculate bezier
bzPtLow=bazier(ctrlPointList, 0.2); % low LoD
bzPtHigh=bazier(ctrlPointList, 0.01); % high LoD


%% 
outlineVertexList = ctrlPointList; %Enrich outlineVertexList
%% scale
catImage_4=imresize(catImage, 4);
imwrite(catImage_4, 'catImage_4.png');
ctrlPointList_4= 4*ctrlPointList;
outlineVertexList_4=4*outlineVertexList;
bzPtLow_4=4*bzPtLow;
bzPtHigh_4=4*bzPtHigh;
%% Draw and fill the polygon
subplot(2, 3, 1);
drawAndFillPolygon( catImage, ctrlPointList, outlineVertexList, true, true, true ); %ctrlPointScattered, polygonPlotted, filled
title('(a).original points');

subplot(2, 3, 2);
drawAndFillPolygon( catImage, bzPtLow, bzPtLow, true, true, true );
title('(a).Low LoD');

subplot(2, 3, 3);
drawAndFillPolygon( catImage, bzPtHigh, bzPtHigh, true, true, true );
title('(a).High LoD');

% imshow(catImage_4);

subplot(2, 3, 4);
drawAndFillPolygon( catImage_4, ctrlPointList_4, outlineVertexList_4, false, true, true ); 
title('(b).original points');

subplot(2, 3, 5);
drawAndFillPolygon( catImage_4, bzPtLow_4, bzPtLow_4, false, true, true ); 
title('(b).Low LoD');

subplot(2, 3, 6);
drawAndFillPolygon( catImage_4, bzPtHigh_4, bzPtHigh_4, false, true, true ); 
title('(b).High LoD');