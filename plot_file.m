x=-30:0.1:30;
y=x-5;
y2=x.*x.*x+356.*x
ylabel('y')
xlabel('x')

plot(x,y,'lineWidth',2,'Color',[0,1,0])
hold on
plot(x,y2,'lineWidth',2,'Color',[1,0,0])
