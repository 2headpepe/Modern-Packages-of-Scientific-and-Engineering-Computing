function ret = f2(n,m)
  A=false(n,m)
  A(1:n,1:2:m)=true
  ret =A
endfunction
