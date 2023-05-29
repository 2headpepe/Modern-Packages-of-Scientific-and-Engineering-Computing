function retval = Normal (fun, x0, y0)
    x = -pi:0.01:pi;
    y = -pi:0.01:pi;
    [X,Y] = meshgrid(x,y);
    Z = fun(X,Y);


    hold on;
    h = 1e-8;
    z0 = fun(x0, y0);
    dx = (fun(x0 + h, y0) - fun(x0, y0)) / h
    dy = (fun(x0, y0 + h) - fun(x0, y0)) / h

    t = 0:0.01:1;
    XN = dx * t + x0;
    YN = dy * t + y0;
    ZN = -t + z0;
    plot3(XN, YN, ZN);
    axis equal;
    S = surf(X, Y, Z);
    set(S, "facealpha", 0.5)


    xlabel('x');
    ylabel('y');
    zlabel('z');
    shading interp;
    facealpha (0.5);
    hold off
endfunction
