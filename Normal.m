function retval = normal (fun, x0, y0,h)
    if(exist("h")==0)
      h = 1e-8;
    end

    x = -pi:0.01:pi;
    y = -pi:0.01:pi;
    [X,Y] = meshgrid(x,y);
    Z = fun(X,Y);


    hold on;
    xlabel('x');
    ylabel('y');
    zlabel('z');

    %% dx, dy - coefs for normal
    z0 = fun(x0, y0);
    dx = (fun(x0 + h, y0) - fun(x0, y0)) / h
    dy = (fun(x0, y0 + h) - fun(x0, y0)) / h

    %% creating array of values for normal line
    t = 0:0.01:5;
    XN = dx * t + x0;
    YN = dy * t + y0;
    ZN = -t + z0;
    plot3(XN, YN, ZN);
    axis equal;
    S = surf(X, Y, Z);
    set(S, "facealpha", 0.5)



    shading interp;
    hold off
endfunction
