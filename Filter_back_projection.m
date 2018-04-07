%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 滤波反投影重建算法
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 创建人：王宇清
% 日期：18/04/06
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
% 生成大小为256＊256的Shepp-Logan体模
Ph = phantom(256);
% radon
Sino = radon(Ph,0:179);
% backprojection without filter
Unfiltered = iradon(Sino,0:179,'linear','none');
% backprojection with filter
Filtered = iradon(Sino,0:179);

% 显示结果
figure();
subplot(2,2,1);
imshow(Ph),title('Shepp-Logan');
subplot(2,2,2);
imshow(Sino,[]),title('Sinogram');
subplot(2,2,3);
imshow(Unfiltered,[]),title('Backprojection without filter');
subplot(2,2,4);
imshow(Filtered,[]),title('Backprojection with filter');
