%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ����Ҷ��Ƭ����֤��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% �����ˣ�������
% ���ڣ�18/04/06
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
% ���ɴ�СΪ256��256��Shepp-Logan��ģ
Ph = phantom(256);
% ��ͼ����ת270�㣬�൱�ڦ�=90�㣬
% ʹ��X������X��ƽ�еķ������ͶӰ
Rotated=imrotate(Ph,270);
% ͶӰ
Project=sum(Rotated,1);
% 1-D FFT
FFT1 = fft(Project);
FFT1 = FFT1 .* conj(FFT1);
% 2-D FFT
FFT2 = fft2(Ph);
FFT2 = FFT2(:,1);
FFT2 = FFT2 .* conj(FFT2);
FFT2 = FFT2';

% ��ʾ���
figure();
imshow(Ph),title('Shepp-Logan��ģ');
figure();
subplot(2,1,1);
plot(1:length(FFT1), FFT1),title('1-D FFT');
subplot(2,1,2);
plot(1:length(FFT2), FFT2),title('2-D FFT');
figure();
subplot(2,1,1);
AbsError = FFT2 - FFT1;
plot(1:length(AbsError), AbsError),title('�������');
subplot(2,1,2);
RelativeError = AbsError ./ FFT1;
plot(1:length(RelativeError), RelativeError),title('������');
