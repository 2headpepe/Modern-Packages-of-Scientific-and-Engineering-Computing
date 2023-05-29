function res = proisvod(f,x0)
  h=1e-6;
  res = (f(x0+h)-f(x0))/h;
end
