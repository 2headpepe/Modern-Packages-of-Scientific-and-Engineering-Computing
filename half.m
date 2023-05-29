function retval = half(f, x0)
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
        fz =  find(f, X0(i)-1,X0(i)+1,1e-6,X0(i)-2);
        if(fz!=X0(i)-2)
            ANS1(end+1) = fz;
        end
    end
    retval=uniquetol(ANS1,1e-6);
    plot(ANS1, f(ANS1), 'ro');
    hold off;
end
function root = find(func, a, b,err,except)
    if(exist("err")==0)
        err=1e-6;
    end
    if func(a) * func(b) >= 0
        root=except;
        return;
    end

##    x=a:0.01:b;
##    plot(x, func(x));
##    hold on;
##    xlabel('x');
##    ylabel('y');
####    zlabel('z');
##    grid on;

    maxIterations = 1000;
    iteration = 1;

    while iteration <= maxIterations
        c = (a + b) / 2;

        if abs(func(c)) <= err
            root = c;
##            plot(root, func(root), 'ro');
            return;
        end

        if func(c) * func(a) < 0
            b = c;
        else
            a = c;
        end

        iteration = iteration + 1;
    end

    root = except;
end
