%% heart beat Rate
global SampleRate_t RR_T QRS heartbeat PR X1 Y1 std_value
[pks,locs] = findpeaks(result,SampleRate_t,'MinPeakHeight',0.4);         %500 is the sample rate, 2.2 is equal to the minpeakheight
%plot(t,result);
%hold on;
a = [pks,locs];
[pks2,locs2] = findpeaks(result,SampleRate_t,'MinPeakDistance',0.25);    %500 is the sample rate, 0.25 is the minpeakdistance
b = [pks2,locs2];
ccc = intersect(a,b,'rows');
[m,n] = size(ccc);
heartbeat = m;
%scatter(ccc(:,2),ccc(:,1),'*','r');

%% plot out
[X1,Y1] = findpeaks(result,SampleRate_t);
plot(Y1,X1);
hold on;
scatter(ccc(:,2),ccc(:,1),'*','r');
%% RR interval
ddd = ccc(:,2);
ddd = sort(ddd);
RR_T = mean(abs(ddd(2:m)-ddd(1:m-1)));
%% QRS interval
[pksqrs,locsqrs] = findpeaks(result,SampleRate_t);
[pksqrs,locsqrs] = findpeaks(pksqrs,locsqrs);
pre = [pksqrs,locsqrs];
%scatter(locsqrs,pksqrs);
alpha = find(ismember(pre(:,2),ccc(:,2))==1);
alpha1 = alpha - 1;
alpha2 = alpha + 1;
alpha1(1) = [];
alpha2(1) = [];
alpha1(length(alpha1)) = [];
alpha2(length(alpha2)) = [];
scatter(locsqrs(alpha1),pksqrs(alpha1),'g','o');                          %QRS前一个点
scatter(locsqrs(alpha2),pksqrs(alpha2),'r','o');                          %QRS后一个点    %%卧槽，这组QRS排序想了两个小时........%%
grid on;
Time1 = locsqrs(alpha1);
Time2 = locsqrs(alpha2);
QRS = mean(abs(Time1 - Time2));
%% PR interval
alpha3 = alpha1 - 1;
%scatter(locsqrs(alpha3),pksqrs(alpha3),'g','*');
alpha4 = alpha3 - 1;
%scatter(locsqrs(alpha4),pksqrs(alpha4),'g','*');
scatter((locsqrs(alpha3)+locsqrs(alpha4))/2,(pksqrs(alpha3)+pksqrs(alpha4))/2,'g','*');
Time3 = (locsqrs(alpha3)+locsqrs(alpha4))/2;
PR = mean(abs(Time1 - Time3));
hold off;
%% std
std_value = std(result);
