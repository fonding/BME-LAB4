global heartbeat
path = num2str(heartbeat);
if heartbeat < 100
    if length(path) == 1
        [y,fs] = audioread([path,'.wav']);
        sound(y,fs);
    end
    if length(path) == 2
        if path(2) == '0'
            path1 = path(1);
            [y1,fs1] = audioread([path1,'.wav']);
            [y2,fs2] = audioread('SHI.wav');
            sound(y1,fs1);
            pause(0.6);
            sound(y2,fs2);
        end
        if path(2) ~= '0'
        path1 = path(1);
        path2 = path(2);
        [y1,fs1] = audioread([path1,'.wav']);
        [y2,fs2] = audioread('SHI.wav');
        [y3,fs3] = audioread([path2,'.wav']);
        sound(y1,fs1);
        pause(0.5);
        sound(y2,fs2);
        pause(0.5);
        sound(y3,fs3);
        end
    end
end
if heartbeat == 100
    [y1,fs1] = audioread('1.wav');
    [y, fs] = audioread('BAI.wav');
    sound(y1,fs1);
    pause(0.5);
    sound(y,fs);
end
if heartbeat > 100
    if path(3) == '0'
        [y1,fs1] = audioread('1.wav');
        [y2,fs2] = audioread('BAI.wav');
        path1 = path(2);
        [y3,fs3] = audioread('SHI.wav');
        [y5,fs5] = audioread([path1,'.wav']);
        sound(y1,fs1);
        pause(0.5);
        sound(y2,fs2);
        pause(0.5);
        sound(y5,fs5);
        pause(0.5);
        sound(y3,fs3);
    end
    if path(2) == '0'
        [y1,fs1] = audioread('1.wav');
        [y2,fs2] = audioread('BAI.wav');
        [y3,fs3] = audioread('0.wav');
        path2 = path(3);
        [y5,fs5] = audioread([path2,'.wav']);
        sound(y1,fs1);
        pause(0.5);
        sound(y2,fs2);
        pause(0.5);
        sound(y3,fs3);
        pause(0.5);
        sound(y5,fs5);
    end
    if path(3) ~= '0'&& path(2) ~='0'
    [y1,fs1] = audioread('1.wav');
    [y2,fs2] = audioread('BAI.wav');
    [y3,fs3] = audioread('SHI.wav');
    path1 = path(2);
    path2 = path(3);
    [y4,fs4] = audioread([path1,'.wav']);
    [y5,fs5] = audioread([path2,'.wav']);
    sound(y1,fs1);
    pause(0.5);
    sound(y2,fs2);
    pause(0.5);
    sound(y4,fs4);
    pause(0.5);
    sound(y3,fs3);
    pause(0.5);
    sound(y5,fs5);
    end
end