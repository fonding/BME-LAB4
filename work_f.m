%！！！！！�C揮�歛鵬�匂雙崙垢撞孤氾！！！！！！-  
%50Hz�櫺�匂�采敏燦�詰宥陀襖匂紗貧匯倖互宥陀襖匂怏撹  
%遇互宥陀襖匂喇匯倖畠宥陀襖匂受肇匯倖詰宥陀襖匂更撹  
global SampleRate_t
Me=100;               %陀襖匂竣方  
L=100;                %完笥海業  
beta=100;             %縫受狼方
wc1=49/SampleRate_t*pi;     %wc1葎互宥陀襖匂舜峭撞楕��斤哘51Hz  
wc2=51/SampleRate_t*pi;     %wc2葎詰宥陀襖匂舜峭撞楕��斤哘49Hz

h=ideal_lp(0.132*pi,Me)-ideal_lp(wc1,Me)+ideal_lp(wc2,Me); %h葎�櫺�匂  
w=kaiser(L,beta);                                          %喝似�贄�  
y=h.*rot90(w);         %y葎50Hz�櫺�匂喝似�贄π鯀�  
m2=filter(y,1,m1);

% figure  
% subplot(2,1,1);plot(abs(h));axis([0 100 0 0.2]);  
% xlabel('撞楕(Hz)');ylabel('嫌業(mv)');title('�櫺�匂嫌業惇');grid;  
% N=512;  
% P=10*log10(abs(fft(y).^2)/N);  
% f=(0:length(P)-1);  
% subplot(2,1,2);plot(f,P);  
% xlabel('撞楕(Hz)');ylabel('孔楕(dB)');title('�櫺�匂孔楕惇');grid;  
%      
% figure  
% subplot (2,1,1); plot(TIME,v);  
% xlabel('t(s)');ylabel('嫌峙');title('圻兵佚催');grid;  
% subplot(2,1,2);plot(TIME,m2);  
% xlabel('t(s)');ylabel('嫌峙');title('揮怦陀襖朔佚催');grid;  
%     
% figure  
% N=512;  
% subplot(2,1,1);
% %序佩撞惇延算�┯祇鑷怯篁撮�  
% plot(abs(fft(v))*2/N);axis([0 100 0 1]);  %鮫竃撞惇夕  
% xlabel('t(s)');ylabel('嫌峙');title('圻兵佚催撞惇');grid;  
% subplot(2,1,2);plot(abs(fft(m2))*2/N);axis([0 100 0 1]);  
% xlabel('t(s)');ylabel('嫌峙');title('揮怦陀襖朔佚催撞惇');grid;    
  
%凪嶄��ideal_lp�┌�痕方壓総匯倖M猟周嶄��醤悶泌和��  
%尖�覽様�陀襖匂  
%舜峭叔撞楕wc��竣方Me  
base_f;
%notchex;
%example;