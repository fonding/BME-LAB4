%����������������������ͨ�˲����˳������źš�������������������  
global v v1 v2 v3 t 
%t = xlsread('byh_ECG_data.xlsx','sheet1','a1:a2500');
%V = xlsread('byh_ECG_data.xlsx','sheet1','b1:b2500');
%load('ECGsampledata.mat');
%v1 = V;
v1 = v1-mean(v1);         %ȥ��ֱ������
global SampleRate_t
%SampleRate_t = 500;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%SampleRate_t=500;                          %����Ƶ��  
fp=80;fs=100;                    %ͨ����ֹƵ�ʣ������ֹƵ��  
rp=1.4;rs=1.6;                    %ͨ�������˥��  
wp=2*pi*fp;ws=2*pi*fs;     
[n,wn]=buttord(wp,ws,rp,rs,'s');     %��s����ȷ��������˹ģ���˲����״κ�3dB  
                              % ��ֹģ��Ƶ��  
[z,P,k]=buttap(n);   %��ƹ�һ��������˹ģ���ͨ�˲�����zΪ���㣬pΪ����kΪ����  
[bp,ap]=zp2tf(z,P,k);  %ת��ΪHa(p),bpΪ����ϵ����apΪ��ĸϵ��  
[bs,as]=lp2lp(bp,ap,wp); %Ha(p)ת��Ϊ��ͨHa(s)��ȥ��һ����bsΪ����ϵ����asΪ��ĸϵ��  
  
[hs,ws]=freqs(bs,as);         %ģ���˲����ķ�Ƶ��Ӧ  
[bz,az]=bilinear(bs,as,SampleRate_t);     %��ģ���˲���˫���Ա任  
[h1,w1]=freqz(bz,az);         %�����˲����ķ�Ƶ��Ӧ  
m1=filter(bz,az,v1);  
%work_f;
notchex;                             %������Ƶ�����˲���
% figure  
% freqz(bz,az);title('������˹��ͨ�˲�����Ƶ����');  
        
% figure  
% subplot(2,1,1);  
% plot(t,V);  
% xlabel('t(s)');ylabel('mv');title('ԭʼ�ĵ��źŲ���');grid;  
%   
% subplot(2,1,2);  
% plot(t,v);  
% xlabel('t(s)');ylabel('mv');title('��ͨ�˲����ʱ��ͼ��');grid;  
     
% N=512;  
% n=0:N-1;  
% mf=fft(v,N);               %����Ƶ�ױ任������Ҷ�任��  
% mag=abs(mf);  
% f=(0:length(mf)-1)*Fs/length(mf);  %����Ƶ�ʱ任  
  
% figure  
% subplot(2,1,1)  
% plot(f,mag);axis([0,1500,1,50]);grid;      %����Ƶ��ͼ  
% xlabel('Ƶ��(HZ)');ylabel('��ֵ');title('�ĵ��ź�Ƶ��ͼ');  
  
% mfa=fft(v,N);                    %����Ƶ�ױ任������Ҷ�任��  
% maga=abs(mfa);  
% fa=(0:length(mfa)-1)*Fs/length(mfa);  %����Ƶ�ʱ任  
% subplot(2,1,2)  
% plot(fa,maga);axis([0,1500,1,50]);grid;      %����Ƶ��ͼ 
% xlabel('Ƶ��(HZ)');ylabel('��ֵ');title('��ͨ�˲����ĵ��ź�Ƶ��ͼ');  
      
% wn=V;  
% P=10*log10(abs(fft(wn).^2)/N);  
% f=(0:length(P)-1)/length(P);  
% figure  
% plot(f,P);grid  
% xlabel('��һ��Ƶ��');ylabel('����(dB)');title('�ĵ��źŵĹ�����'); 