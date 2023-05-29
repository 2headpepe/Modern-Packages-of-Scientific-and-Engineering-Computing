function res = animation(r,x0,f,numOfCircles)

  list =[]
  hold on
  y0=f(x0);
  X=x0*ones(numOfCircles);
  Y=y0*ones(numOfCircles);
  t=0:pi/100:2*pi;
  x=r.*cos(t)+X(1);
  y=r.*sin(t)+Y(1);

  ph = plot(x,y);
##  axis([x0 x0+20 ]);
  list(1)=ph;

  delta=r./10000;
  for i = 2:numOfCircles
    dfx = (f(X(i-1)+delta)-f(X(i-1)))/delta;
    a = atan(dfx);
    X(i)=X(i-1)+2.*r.*cos(a);
    Y(i)=Y(i-1)+2.*r.*sin(a);
    list(end+1) = circle(r,X(i),Y(i),ph,x0,y0);
  endfor
  t=0:pi/100:2*pi;
  pause(1);

  for i = 0:pi/1000:2*pi
    for j=1:numOfCircles-1
      x=r.*cos(t)+X(j+1);
      X(j)=X(j+1);
      y=r.*sin(t)+Y(j+1);
      Y(j)=Y(j+1);
      set(list(j),'YDATA',y,'XDATA',x);
      drawnow
    endfor
      dfx = (f(X(numOfCircles)+delta)-f(X(numOfCircles)))/delta;
      a = atan(dfx);
      x+=2.*r.*cos(a);
      X(numOfCircles)+=2.*r.*cos(a);
      y+=2.*r.*sin(a);
      Y(numOfCircles)+=2.*r.*sin(a);

      set(list(numOfCircles),'YDATA',y,'XDATA',x);
      pause(0.05);

      drawnow

  endfor
end






function ph= circle(r,x0,y0,ph,xAxis,yAxis)
  t=0:pi/100:2*pi;
  x=r.*cos(t)+x0;
  y=(r.*sin(t)+y0);

  ph=plot(x,y);
  axis([xAxis xAxis+100 yAxis-50 yAxis+50]);
end

