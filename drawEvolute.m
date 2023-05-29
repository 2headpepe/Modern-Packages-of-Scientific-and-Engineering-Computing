function drawEvolute(f)
    % Define the function f(x) and its derivative df(x)
##    f = @(x) x.^2; % Example function: x^2
##    df = @(x) 2.*x; % Derivative: 2x

    % Specify the range of x values
    xRange = -10:0.01:10; % Adjust the range as needed
##    ph = plot(x,f(x));
    % Initialize arrays for storing coordinates
    evoluteCoords = [];
    involuteCoords = [];

    % Calculate the coordinates for the evolute and involute curves
    for x = -1:0.01:1
        y = f(x);
        dfTmp = df(f,x);
        d2fTmp = d2f(f,x);

        evoluteX = x - dfTmp*(1+dfTmp^2 )/d2fTmp;
        evoluteY = y + (1+dfTmp^2)/d2fTmp;


        involuteX = x;
        involuteY = y;

        % Store the coordinates in the arrays
        evoluteCoords = [evoluteCoords; evoluteX, evoluteY];
        involuteCoords = [involuteCoords; involuteX, involuteY];
    end

    % Plot the evolute and involute curves
    figure;
    hold on;
    plot(evoluteCoords(:, 1), evoluteCoords(:, 2), 'r');
##    plot(xRange,f(xRange));
    plot(involuteCoords(:, 1), involuteCoords(:, 2), 'b');
    xlabel('x');
    ylabel('y');
    title('Evolute and Involute Curves');
    legend('Evolute', 'Involute');
    hold off;
end
function res = df(f,x0,h)
  if(exist("h")==0)
    h=1e-6;
  end
  res = (f(x0+h)-f(x0))/h;
end
function d2f = d2f(func, x0, h)
  if(exist("h")==0)
    h=1e-6;
  end
  % Compute the second derivative using central difference approximation
    d2f = (func(x0 + h) - 2 * func(x0) + func(x0 - h)) / h^2;
end

