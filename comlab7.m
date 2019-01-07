sum=0;
sum2=0;

n=1:50;
N=[50 100 10];
mean=zeros(1,3);
error=zeros(1,3);



for t=1:3
    m=zeros(1,N(t));
for i=1:N(t)
  X=10*rand(1,N(t));
   for j=1:N(t)
    sum=X(j)+sum;
   end
   m(i)=sum/N(t);
   sum=0;
end

for k=1:N(t)
    sum2=m(i)+sum2;
end
mean(t)=sum2/N(t);
sum2=0;
error(t)=(abs((mean(t)-5))/5)*100;

for a=1:10
    true(a)=5;
end 


figure,stem(m);
figure,stem(mean);
hold on;
plot(true);
end
