%�����������C�����˲������ƹ�Ƶ���š�����������-  
%50Hz�ݲ�������һ����ͨ�˲�������һ����ͨ�˲������  
%����ͨ�˲�����һ��ȫͨ�˲�����ȥһ����ͨ�˲�������  
global SampleRate_t
Me=100;               %�˲�������  
L=100;                %���ڳ���  
beta=100;             %˥��ϵ��
wc1=49/SampleRate_t*pi;     %wc1Ϊ��ͨ�˲�����ֹƵ�ʣ���Ӧ51Hz  
wc2=51/SampleRate_t*pi;     %wc2Ϊ��ͨ�˲�����ֹƵ�ʣ���Ӧ49Hz

h=ideal_lp(0.132*pi,Me)-ideal_lp(wc1,Me)+ideal_lp(wc2,Me); %hΪ�ݲ���  
w=kaiser(L,beta);                                          %�����Ӧ  
y=h.*rot90(w);         %yΪ50Hz�ݲ��������Ӧ����  
m2=filter(y,1,m1);

% figure  
% subplot(2,1,1);plot(abs(h));axis([0 100 0 0.2]);  
% xlabel('Ƶ��(Hz)');ylabel('����(mv)');title('�ݲ���������');grid;  
% N=512;  
% P=10*log10(abs(fft(y).^2)/N);  
% f=(0:length(P)-1);  
% subplot(2,1,2);plot(f,P);  
% xlabel('Ƶ��(Hz)');ylabel('����(dB)');title('�ݲ���������');grid;  
%      
% figure  
% subplot (2,1,1); plot(TIME,v);  
% xlabel('t(s)');ylabel('��ֵ');title('ԭʼ�ź�');grid;  
% subplot(2,1,2);plot(TIME,m2);  
% xlabel('t(s)');ylabel('��ֵ');title('�����˲����ź�');grid;  
%     
% figure  
% N=512;  
% subplot(2,1,1);
% %����Ƶ�ױ任������Ҷ�任��  
% plot(abs(fft(v))*2/N);axis([0 100 0 1]);  %����Ƶ��ͼ  
% xlabel('t(s)');ylabel('��ֵ');title('ԭʼ�ź�Ƶ��');grid;  
% subplot(2,1,2);plot(abs(fft(m2))*2/N);axis([0 100 0 1]);  
% xlabel('t(s)');ylabel('��ֵ');title('�����˲����ź�Ƶ��');grid;    
  
%���У�ideal_lp������������һ��M�ļ��У��������£�  
%�����ͨ�˲���  
%��ֹ��Ƶ��wc������Me  
base_f;
%notchex;
%example;