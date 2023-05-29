function retval = SOLVER(f, x0)
  defaultRoot = -3000000;
    h = 1e-10;

    c = [1,0,0,-1]
    root = roots(c)
    eps = 1e-9;

    matrix = ones(x0*20,x0*20);
    im = -x0:0.05:x0;
    re = -x0:0.05:x0;
    [IM,REAL]=meshgrid(im,re);
    for j = 1:x0*40
      for r = 1:x0*40
        z =REAL(r,j)+IM(r,j)*1i;
        fz =  newton(f, z,defaultRoot);

        if(abs(fz-defaultRoot)<eps)
          matrix(j,r)=10;
        end
        if(abs(fz-root(1))<eps)
          matrix(j,r)=20;
        end
        if(abs(fz-root(2))<eps)
          matrix(j,r)=30;
        end
        if(abs(fz-root(3))<eps)
          matrix(j,r)=40;
        end

      end
    end
    figure
    image(matrix);
    colorbar

##    hold off;
end


function [root, iter] = newton(f, x0,defaultRoot)
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
    root=defaultRoot;
end



function [root, iter] = newton2(f, x0)
  df = @(x) 3*x.^2;
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
    dfx = df(x0);
    x1 = x0 - fx ./ dfx;
    if abs(x1 - x0) < tol
      root = x1;
      return;
    end
    x0 = x1;
    iter = iter + 1;
  end
  root = -5*x0;
end

