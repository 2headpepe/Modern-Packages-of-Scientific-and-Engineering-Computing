function res = caterpooly(x0,y0,left,right,bottom,top)
  list =[]
  hold on
##  y0=initi;
  velocityX = 1;
  velocityY=1.5;
  numOfCircles=5;
  r=2;
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
    X(i)=X(i-1)+velocityX;
    Y(i)=Y(i-1)+velocityY;
    list(end+1) = circle(r,X(i),Y(i),ph,left-100,right+100,bottom-100,top+100);
  endfor
  iterations=1000;
  rectangle('Position', [left, bottom, right-left, top-bottom], 'EdgeColor', 'r');
  for i = 0:pi/1000:2*pi
    for j=1:numOfCircles-1
      x=r.*cos(t)+X(j+1);
      X(j)=X(j+1);
      y=r.*sin(t)+Y(j+1);
      Y(j)=Y(j+1);
      set(list(j),'YDATA',y,'XDATA',x);
      drawnow
    endfor
##      dfx = (f(X(numOfCircles)+delta)-f(X(numOfCircles)))/delta;
##      a = atan(dfx);
      a = sqrt(velocityX.^2+velocityY.^2);

      newX = x+2.*r.*(velocityX/a);
      newY = y+2.*r.*(velocityY/a);
      if(newX<left || newX>right)
        velocityX=-velocityX;
        newX = x+2.*r.*(velocityX/a);
      end
      if(newY>top || newY<bottom)
        velocityY=-velocityY;
        newY = y+2.*r.*(velocityY/a);
      end
      x=newX;
      X(numOfCircles)+=2.*r.*(velocityX/a);
      y=newY;
      Y(numOfCircles)+=2.*r.*(velocityY/a);

      set(list(numOfCircles),'YDATA',y,'XDATA',x);
      pause(0.05);

      drawnow

  endfor

##  t=0:pi/100:2*pi;
##  pause(1);
end



function ph= circle(r,x0,y0,ph,xLeft,xRight,yLeft,yRight)
  t=0:pi/100:2*pi;
  x=r.*cos(t)+x0;
  y=(r.*sin(t)+y0);

  ph=plot(x,y);
  axis([xLeft xRight yLeft yRight]);
end
