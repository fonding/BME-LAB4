%������������IIR�����������˲�����������Ư�ơ�����������-  
global SampleRate_t result
Wp=1.4*2/SampleRate_t;                %ͨ����ֹƵ��   
Ws=0.6*2/SampleRate_t;                %�����ֹƵ��   
devel=0.005;                          %ͨ���Ʋ�   
Rp=20*log10((1+devel)/(1-devel));     %ͨ���Ʋ�ϵ��    
Rs=20;                                %���˥��   
[N,Wn]=ellipord(Wp,Ws,Rp,Rs,'s');     %����Բ�˲����Ľ״�   
[b,a]=ellip(N,Rp,Rs,Wn,'high');       %����Բ�˲�����ϵ��   
[hw,w]=freqz(b,a,512);     
result =filter(b,a,m2);   
  
% figure  
% freqz(b,a);  
% figure  
% subplot(211); plot(TIME,m2);   
% xlabel('t(s)');ylabel('��ֵ');title('ԭʼ�ź�');grid  
% subplot(212); 
% plot(TIME,result);   
% xlabel('t(s)');ylabel('��ֵ');title('�����˲����ź�');grid  

% figure  
% N=512;  
% subplot(2,1,1);plot(abs(fft(m2))*2/N);  
% xlabel('Ƶ��(Hz)');ylabel('��ֵ');title('ԭʼ�ź�Ƶ��');grid;  
% subplot(2,1,2);plot(abs(fft(result))*2/N);  
% xlabel('Ƶ��(Hz)');ylabel('��ֵ');title('�����˲���');grid;
% subplot(2,1,2);plot(abs(fft(result))*2/N);  
% xlabel('�����˲����ź�Ƶ��');ylabel('��ֵ');grid;
heart_beat;