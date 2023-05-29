function retval = newton_draw(f, x0)
    h = 1e-10;

    c = [1,0,0,-1]
    root = roots(c)
    eps = 1e-9;

    matrix = ones(x0*20,x0*20);
    for j = 1:x0*20+1
      for r = 1:x0*20+1
        z =(r-x0*10-1)*0.1 + (j-x0*10-1)*0.1*1i;
        fz =  newton(f, z);

        if(abs(fz-root(1))<eps)
          matrix(j,r)=20;
        elseif(abs(fz-root(2))<eps)
          matrix(j,r)=30;
        elseif(abs(fz-root(3))<eps)
          matrix(j,r)=40;
        else
          matrix(j,r)=100;
        end

      end
    end
    figure
    image(matrix);
    colorbar

##    hold off;
end


function [root, iter] = newton(f, x0)
  df = @(x) 3*x.^2;
  tol = 1e-9;
  maxiter=40;
    iter = 0;
    while iter < maxiter
        fx = f(x0);
        if abs(fx) < tol
            root = x0;
            return;
        end
        dfx = df(x0);
        x1 = x0 - fx ./ dfx;
        if abs(x1 - x0) < tol
            root = x1;
            return;
        end
        x0 = x1;
        iter = iter + 1;
    end
    root=-3000000
end
