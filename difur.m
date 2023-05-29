% заданные параметры
##L = 1;  % длина подвеса
 % ускорение свободного падения
##theta0 = pi/4; % начальный угол отклонения
% время

% начальные условия

function res = difur(L,phi0,x0,y0)
% шаг по времени
  t = 0:0.01:10;
  g = 9.81;
  phi(1) = phi0;
  omega(1) = 0;
  dt = t(2)-t(1);

% цикл по времени
  for i=2:length(t)
    % вычисляем ускорение
    alpha = -g/L*sin(phi(i-1));

    % вычисляем новый угол и скорость маятника
    phi(i) = phi(i-1) + omega(i-1)*dt;
    omega(i) = omega(i-1) + alpha*dt;
  end

  % координаты точки, в которой закреплен подвес
##  a = 0;
##  b = 0;

% анимация
  for i=1:length(t)
    % координаты маятника
    x = x0 + L*sin(phi(i));
    y = y0 - L*cos(phi(i));

    % рисуем маятник
    plot([x0 x], [y0 y], '-o', 'LineWidth', 2, 'MarkerSize', 10, 'MarkerFaceColor', 'r');
    xlim([x0-L*2 x0+L*2]);
    ylim([y0-L*2 y0+L]);
    grid on;
##    title(sprintf('Time: %.2f sec', t(i)));
    drawnow;
  end
end
