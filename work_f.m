%—————–带陷滤波器抑制工频干扰——————-  
%50Hz陷波器：由一个低通滤波器加上一个高通滤波器组成  
%而高通滤波器由一个全通滤波器减去一个低通滤波器构成  
global SampleRate_t
Me=100;               %滤波器阶数  
L=100;                %窗口长度  
beta=100;             %衰减系数
wc1=49/SampleRate_t*pi;     %wc1为高通滤波器截止频率，对应51Hz  
wc2=51/SampleRate_t*pi;     %wc2为低通滤波器截止频率，对应49Hz

h=ideal_lp(0.132*pi,Me)-ideal_lp(wc1,Me)+ideal_lp(wc2,Me); %h为陷波器  
w=kaiser(L,beta);                                          %冲击响应  
y=h.*rot90(w);         %y为50Hz陷波器冲击响应序列  
m2=filter(y,1,m1);

% figure  
% subplot(2,1,1);plot(abs(h));axis([0 100 0 0.2]);  
% xlabel('频率(Hz)');ylabel('幅度(mv)');title('陷波器幅度谱');grid;  
% N=512;  
% P=10*log10(abs(fft(y).^2)/N);  
% f=(0:length(P)-1);  
% subplot(2,1,2);plot(f,P);  
% xlabel('频率(Hz)');ylabel('功率(dB)');title('陷波器功率谱');grid;  
%      
% figure  
% subplot (2,1,1); plot(TIME,v);  
% xlabel('t(s)');ylabel('幅值');title('原始信号');grid;  
% subplot(2,1,2);plot(TIME,m2);  
% xlabel('t(s)');ylabel('幅值');title('带阻滤波后信号');grid;  
%     
% figure  
% N=512;  
% subplot(2,1,1);
% %进行频谱变换（傅里叶变换）  
% plot(abs(fft(v))*2/N);axis([0 100 0 1]);  %画出频谱图  
% xlabel('t(s)');ylabel('幅值');title('原始信号频谱');grid;  
% subplot(2,1,2);plot(abs(fft(m2))*2/N);axis([0 100 0 1]);  
% xlabel('t(s)');ylabel('幅值');title('带阻滤波后信号频谱');grid;    
  
%其中，ideal_lp（）函数在另一个M文件中，具体如下：  
%理想低通滤波器  
%截止角频率wc，阶数Me  
base_f;
%notchex;
%example;