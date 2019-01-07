fm=120; fc=1200; fs=120000;
t=0:1/fs:5/120;

m=5*cos(2*pi*fm*t);
c=cos(2*pi*fc*t);

N= length(m);
u1=m.*c;
f1=linspace(-fs/2,fs/2,N);
fftx=abs(fftshift(fft(u1,N))/N);

figure(1)
plot (t,m);
hold on
plot(t,c);


 figure(2) 
 subplot(211); plot(t,u1);
 subplot(212); plot(f1,fftx);

Wn=fc/(fs/2);

demod=u1.*cos(2*pi*fc*t);
[b,a]=butter(5,Wn,'low');
y1=filter(b,a,demod);

figure(3)
plot(t,y1);
hold on
plot(t,m);


