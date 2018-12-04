%——————————低通滤波器滤除肌电信号——————————  
global v v1 v2 v3 t 
%t = xlsread('byh_ECG_data.xlsx','sheet1','a1:a2500');
%V = xlsread('byh_ECG_data.xlsx','sheet1','b1:b2500');
%load('ECGsampledata.mat');
%v1 = V;
v1 = v1-mean(v1);         %去除直流分量
global SampleRate_t
%SampleRate_t = 500;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%SampleRate_t=500;                          %采样频率  
fp=80;fs=100;                    %通带截止频率，阻带截止频率  
rp=1.4;rs=1.6;                    %通带、阻带衰减  
wp=2*pi*fp;ws=2*pi*fs;     
[n,wn]=buttord(wp,ws,rp,rs,'s');     %’s’是确定巴特沃斯模拟滤波器阶次和3dB  
                              % 截止模拟频率  
[z,P,k]=buttap(n);   %设计归一化巴特沃斯模拟低通滤波器，z为极点，p为零点和k为增益  
[bp,ap]=zp2tf(z,P,k);  %转换为Ha(p),bp为分子系数，ap为分母系数  
[bs,as]=lp2lp(bp,ap,wp); %Ha(p)转换为低通Ha(s)并去归一化，bs为分子系数，as为分母系数  
  
[hs,ws]=freqs(bs,as);         %模拟滤波器的幅频响应  
[bz,az]=bilinear(bs,as,SampleRate_t);     %对模拟滤波器双线性变换  
[h1,w1]=freqz(bz,az);         %数字滤波器的幅频响应  
m1=filter(bz,az,v1);  
%work_f;
notchex;                             %两个工频干扰滤波器
% figure  
% freqz(bz,az);title('巴特沃斯低通滤波器幅频曲线');  
        
% figure  
% subplot(2,1,1);  
% plot(t,V);  
% xlabel('t(s)');ylabel('mv');title('原始心电信号波形');grid;  
%   
% subplot(2,1,2);  
% plot(t,v);  
% xlabel('t(s)');ylabel('mv');title('低通滤波后的时域图形');grid;  
     
% N=512;  
% n=0:N-1;  
% mf=fft(v,N);               %进行频谱变换（傅里叶变换）  
% mag=abs(mf);  
% f=(0:length(mf)-1)*Fs/length(mf);  %进行频率变换  
  
% figure  
% subplot(2,1,1)  
% plot(f,mag);axis([0,1500,1,50]);grid;      %画出频谱图  
% xlabel('频率(HZ)');ylabel('幅值');title('心电信号频谱图');  
  
% mfa=fft(v,N);                    %进行频谱变换（傅里叶变换）  
% maga=abs(mfa);  
% fa=(0:length(mfa)-1)*Fs/length(mfa);  %进行频率变换  
% subplot(2,1,2)  
% plot(fa,maga);axis([0,1500,1,50]);grid;      %画出频谱图 
% xlabel('频率(HZ)');ylabel('幅值');title('低通滤波后心电信号频谱图');  
      
% wn=V;  
% P=10*log10(abs(fft(wn).^2)/N);  
% f=(0:length(P)-1)/length(P);  
% figure  
% plot(f,P);grid  
% xlabel('归一化频率');ylabel('功率(dB)');title('心电信号的功率谱'); 