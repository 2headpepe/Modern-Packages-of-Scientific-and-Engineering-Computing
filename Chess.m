function ret = Chess(n,m)
  if(exist("m")==0)
    m=n;
  end
  a = zeros(n,m);
  for i = 1:2:n*m,
    a(i)=1;
  endfor
  ret=a;
endfunction
