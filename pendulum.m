function res = pendulum(L,theta0)
  if(exist("L")==0)
    L = 1;
  end
  if(exist("theta0")==0)
    theta0 = pi/4;
  end
  g = 9.81;
  t = 0:0.01:10;

  theta(1) = theta0;
  omega(1) = 0;

  dt = t(2)-t(1);

  for i=2:length(t)
    alpha = -g/L*sin(theta(i-1));

    theta(i) = theta(i-1) + omega(i-1)*dt;
    omega(i) = omega(i-1) + alpha*dt;
  end

  a = 0;
  b = 0;

  for i=1:length(t)
    x = a + L*sin(theta(i));
    y = b - L*cos(theta(i));

    plot([a x], [b y], '-o', 'LineWidth', 2, 'MarkerSize', 10, 'MarkerFaceColor', 'r');
    xlim([-1.5 1.5]);
    ylim([-1.5 1.5]);
    grid on;
    title(sprintf('Time: %.2f sec', t(i)));
    drawnow;
end
