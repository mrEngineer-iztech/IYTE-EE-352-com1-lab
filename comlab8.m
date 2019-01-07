fc=20000;
fs=76160;
t=0:1/fs:1-1/fs;
im = imread('circuit.tif');
im2= im2double(im);

m=reshape(im2,[1,fs]);

c=cos(2*pi*fc*t);
u=c.*m;

size=-12:3:12;
N=length(size);

for i=1:N;
   
y=awgn(u,size(i),'measured');
    
Wn=fc/(fs/2);
demod=y.*cos(2*pi*fc*t);
[b,a]=butter(25,Wn,'low');
out=filter(b,a,demod);

m1=reshape(out,[280,272]);

figure(i)
subplot(211);imshow(im);
subplot(212);imshow(m1); 

end