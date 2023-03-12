fs=100;
t=(1:100)/fs;
s=sin(2*pi*t*5)+sin(2*pi*t*15)+sin(2*pi*t*30);
plot(t,s)
grid

Wp1 = 10/50;
Wp2 = 20/50;
Ws1 = 5/50;
Ws2 = 25/50;
wp = [Wp1 Wp2];
ws = [Ws1 Ws2];
rp = 0.1;
rs = 40;
w=wp/(fs/2);
[n,wn] = ellipord(wp,ws,rp,rs);

[b,a] = ellip(n,.1,40,w);
freqz(b,a,128,100)
[h,w]=freqz(b,a,128,100);
figure(1)
plot(w,abs(h));
grid
title('Normalized Magnitude Response');
axis([0 50 0 1.2]);

figure(2)
sf=filter(b,a,s); % Time domain Response of the Filter
plot(t,sf)
grid
xlabel('Time (seconds)');
ylabel('Signal Amplitude');
title('Filtered Signal only 15 Hz frequency');

