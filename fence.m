function ret = fence(n,m)
  if(exist("m")==0)
    m=n;
  end
  A=false(n,m);

  A(1:n,1:2:m)=true;
  ret=A;
endfunction
