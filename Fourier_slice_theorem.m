%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 傅里叶切片定理证明
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 创建人：王宇清
% 日期：18/04/06
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
% 生成大小为256＊256的Shepp-Logan体模
Ph = phantom(256);
% 将图像旋转270°，相当于θ=90°，
% 使得X线以与X轴平行的方向进行投影
Rotated=imrotate(Ph,270);
% 投影
Project=sum(Rotated,1);
% 1-D FFT
FFT1 = fft(Project);
FFT1 = FFT1 .* conj(FFT1);
% 2-D FFT
FFT2 = fft2(Ph);
FFT2 = FFT2(:,1);
FFT2 = FFT2 .* conj(FFT2);
FFT2 = FFT2';

% 显示结果
figure();
imshow(Ph),title('Shepp-Logan体模');
figure();
subplot(2,1,1);
plot(1:length(FFT1), FFT1),title('1-D FFT');
subplot(2,1,2);
plot(1:length(FFT2), FFT2),title('2-D FFT');
figure();
subplot(2,1,1);
AbsError = FFT2 - FFT1;
plot(1:length(AbsError), AbsError),title('绝对误差');
subplot(2,1,2);
RelativeError = AbsError ./ FFT1;
plot(1:length(RelativeError), RelativeError),title('相对误差');
