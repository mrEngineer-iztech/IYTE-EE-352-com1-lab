
f = 50;
Fs=1000; Fm=200;
N=2048; N1=512;
t=0:1/Fs:0.04;
x=cos(2*pi*f*t);
x2=cos(2*pi*f*(t-0.005));
x1=cos(2*pi*f*t);
y= exp(i*2*pi*Fm*t).*x1;

figure (1);
plot (t,x,'r');
xlabel('Time, t');
ylabel('Amplitude');
hold on
plot(t,x2,'g');


fx=linspace(-Fs/2,Fs/2,N);
fftx=abs(fftshift(fft(x,N))/N);
figure(2);
plot(fx,fftx,'y');

fy=linspace(-Fs/2,Fs/2,N1);
ffty=abs(fftshift(fft(y,N1))/N1);
figure(3);
plot(fy,ffty);
%//////////////////////////////////


f1=100; f2=200; N2=1024; fc=150; 
t1=0:1/Fs: 0.05;

x3=2*cos(2*pi*f1*t1)+1.5*sin(2*pi*f2*t1);
fa=linspace(-Fs/2,Fs/2,N2);
ffta=abs(fftshift(fft(x3,N2))/N2);

h=zeros(1,1024);
for k=1:1024
    if(k<350)
        h(k)=0;
    else if(k>650)
        h(k)=0;
        else
            h(k)=1;
        end;
    end;
end;
fftfilter=ffta.*h;

figure(4);
subplot(311); plot(fa,ffta);
subplot(312); plot(fa,h);
subplot(313); plot(fa,fftfilter);

