%——————IIR零相移数字滤波器纠正基线漂移——————-  
global SampleRate_t result
Wp=1.4*2/SampleRate_t;                %通带截止频率   
Ws=0.6*2/SampleRate_t;                %阻带截止频率   
devel=0.005;                          %通带纹波   
Rp=20*log10((1+devel)/(1-devel));     %通带纹波系数    
Rs=20;                                %阻带衰减   
[N,Wn]=ellipord(Wp,Ws,Rp,Rs,'s');     %求椭圆滤波器的阶次   
[b,a]=ellip(N,Rp,Rs,Wn,'high');       %求椭圆滤波器的系数   
[hw,w]=freqz(b,a,512);     
result =filter(b,a,m2);   
  
% figure  
% freqz(b,a);  
% figure  
% subplot(211); plot(TIME,m2);   
% xlabel('t(s)');ylabel('幅值');title('原始信号');grid  
% subplot(212); 
% plot(TIME,result);   
% xlabel('t(s)');ylabel('幅值');title('线性滤波后信号');grid  

% figure  
% N=512;  
% subplot(2,1,1);plot(abs(fft(m2))*2/N);  
% xlabel('频率(Hz)');ylabel('幅值');title('原始信号频谱');grid;  
% subplot(2,1,2);plot(abs(fft(result))*2/N);  
% xlabel('频率(Hz)');ylabel('幅值');title('线性滤波后');grid;
% subplot(2,1,2);plot(abs(fft(result))*2/N);  
% xlabel('线性滤波后信号频谱');ylabel('幅值');grid;
heart_beat;