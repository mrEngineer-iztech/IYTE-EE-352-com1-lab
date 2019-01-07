clear all
fc=3000; Fs=8000; fc1=850;
t=0:1/Fs:4.9902;
c=cos(2*pi*fc*t);

y= audioread('speech_dft_8kHz.wav');
%sound(y,Fs);
y1=transpose(y);
N=length(y1);
u=c.*y1;

Wn=fc/(Fs/2);
[b,a]=butter(25,Wn,'high');
out=filter(b,a,u);

fftu=abs(fftshift((fft(out,N))/N));
f1=linspace(-Fs/2,Fs/2,N);

x=y1.*cos(2*pi*fc*t);
x1= hilbert(y1);
imx=imag(x1);
x3=imx.*sin(2*pi*fc*t);
x4=x-x3;

fftx=abs(fftshift((fft(x4,N))/N));
f2=linspace(-Fs/2,Fs/2,N);

figure(1)
subplot(211);plot(f1,fftu); xlabel('Frequency'); ylabel('amplitude');
subplot(212);plot(f2,fftx);xlabel('Frequency'); ylabel('amplitude');
title('4.1 SSB AM');

Wn1=fc1/(Fs/2);
demod=x4.*cos(2*pi*fc*t);
[b1,a1]=butter(25,Wn1,'low');
out1=filter(b1,a1,demod);

ffty=abs(fftshift((fft(out1,N))/N));
f3=linspace(-Fs/2,Fs/2,N);

fftz=abs(fftshift((fft(y1,N))/N));
f4=linspace(-Fs/2,Fs/2,N);

figure(2)
subplot(211); plot(f3,ffty);xlabel('Frequency'); ylabel('amplitude');
subplot(212);plot(f4,fftz);xlabel('Frequency'); ylabel('amplitude');

figure(3)
subplot(211); plot(t,u);xlabel('Frequency'); ylabel('amplitude');
subplot(212);plot(t,out1);xlabel('Frequency'); ylabel('amplitude');
%sound(out1);
