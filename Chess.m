function ret = Chess(n)
  a = zeros(n)
  for i = 1:2:n*n,
    a(i)=1
  endfor
  ret=a
endfunction
