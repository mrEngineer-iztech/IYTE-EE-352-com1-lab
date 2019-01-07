%SÜLEYMAN ÞEKERCÝ 220206011
%PART 1
clear all
close all
dt=0.001; f1=20; f2=100; fs=10000; fc=1000;
t=0:dt:0.7;

m=cos(2*pi*f1*t)+cos(2*pi*f2*t);
c=cos(2*pi*fc*t);
h1=exp(t);
h2=exp(-t);
x=0;
for i=1:length(t);
    
    x(i)=m(i).*c(i);
end
figure(1); plot(t,x);%x(t) fonksiyonu

y1=conv(x,h1);  y2=conv(x,h2);  
y3=0;
for i=1:length(t);
    y3=y3+y2+y1;
end
t2=0:dt:1.4;
figure(2); plot(t2,y3);

Wn=fc/(fs/2); N=2048;
[A,B,C,D] = butter(7,[1000 1100]/5000);
y4=abs(freqz(A,B,C,D));

ff=linspace(-fs/2,fs/2,N);
fftx=(abs(fftshift(fft(x,N))/N));
fftm=(abs(fftshift(fft(m,N))/N));
ffty4=(abs(fftshift(fft(y4,N))/N));
ffth3=(abs(fftshift(fft(h3,N))/N));

figure(3)
subplot(4,1,1);
plot(ff,m);
subplot(4,1,2);
plot(ff,x);
subplot(4,1,3);
plot(ff,h3);
subplot(4,1,4);
plot(ff,y4);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PART 2%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fsampling=3000;

figure(4)
t1=0:0.001:1;
a=1;
b=3;
x1=square(t1).*sin(2*pi*5*t1);
x2=(1-t1).*cos(2*pi*9*t1);
x3=a*x1+b*x2;

y1=t.*square(t1).*sin(2*pi*5*t1);
y2=t.*(1-t1).*cos(2*pi*9*t1);
y3=t.*(a*square(t1).*sin(2*pi*5*t1)+b*(1-t1).*cos(2*pi*9*t1));
y=a*y1+b*y2;

subplot(3,1,1);
plot(t1,y1);
subplot(3,1,2);
plot(t1,y2);
subplot(3,1,3);
plot(t1,y3);


















