function retval = SOLVER(f, x0)
    h = 1e-10;
    x = -x0*2:0.01:x0*2;
    plot(x, f(x));
    hold on;
    xlabel('x');
    ylabel('y');
    zlabel('z');
    grid on;

    X0 = -x0:0.01:x0;
    ANS1 = [];
    for i = 1:length(X0)
        fz =  newton(f, X0(i));
        if abs(f(fz)) < 1e-6 && fz > -x0 && fz < x0 && fz!=99999999
            ANS1(end+1) = fz;
        end
    end
    retval=uniquetol(ANS1,1e-6);
    plot(ANS1, f(ANS1), 'ro');
    hold off;
end

function [root, iter] = newton(f, x0)
  tol = 1e-6;
  h=1e-10;
  maxiter=100;
    iter = 0;
    while iter < maxiter
        fx = f(x0);
        if abs(fx) < tol
            root = x0;
            return;
        end
        dfx = (f(x0 + h) - f(x0)) / h;
        x1 = x0 - fx / dfx;
        if abs(x1 - x0) < tol
            root = x1;
            return;
        end
        x0 = x1;
        iter = iter + 1;
    end
    root=99999999;
end


