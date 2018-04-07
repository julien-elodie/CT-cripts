%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ���������˲���ͶӰ�ؽ��㷨
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% �����ˣ�������
% ���ڣ�18/04/06
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
% ���ɴ�СΪ128��128��Shepp-Logan��ģ
Ph = phantom(128);
% fanbeam
[F1,Fpos1,Fangles1] = fanbeam(Ph,250);
%
P = radon(Ph);
[F2,Fpos2,Fangles2] = para2fan(P,100,...
    'FanSensorSpacing',0.5,...
    'FanCoverage','minimal',...
    'FanRotationIncrement',1);
% ifanbeam
phReconstructed = ifanbeam(F2,100,...
    'FanSensorSpacing',0.5,...
    'Filter','Shepp-Logan',...
    'OutputSize',128,... 
    'FanCoverage','minimal',...
    'FanRotationIncrement',1);

% ��ʾ���
iptsetpref('ImshowAxesVisible','on')
figure();
subplot(1,2,1);
imshow(Ph),title('Shepp-Logan');

subplot(1,2,2);
imshow(phReconstructed),title('Reconstructed');

figure();
imshow(F1,[],...
    'XData',Fangles1,...
    'YData',Fpos1,...
    'InitialMagnification','fit');
title('fanbeam');
axis normal;
xlabel('Rotation Angles (degrees)');
ylabel('Sensor Positions (degrees)');
colormap(gca,hot),colorbar;
