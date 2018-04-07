%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% �˲���ͶӰ�ؽ��㷨
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% �����ˣ�������
% ���ڣ�18/04/06
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
% ���ɴ�СΪ256��256��Shepp-Logan��ģ
Ph = phantom(256);
% radon
Sino = radon(Ph,0:179);
% backprojection without filter
Unfiltered = iradon(Sino,0:179,'linear','none');
% backprojection with filter
Filtered = iradon(Sino,0:179);

% ��ʾ���
figure();
subplot(2,2,1);
imshow(Ph),title('Shepp-Logan');
subplot(2,2,2);
imshow(Sino,[]),title('Sinogram');
subplot(2,2,3);
imshow(Unfiltered,[]),title('Backprojection without filter');
subplot(2,2,4);
imshow(Filtered,[]),title('Backprojection with filter');
