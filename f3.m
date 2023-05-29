function ret = f3(n,r)
  l=false(n,n);
  %r+=mod(n,2)
  for i=1:n,
    for j=1:n,
      %l(i,j)=((i-n/2)^2+(j-n/2)^2-r^2)<0;
      if mod(n,2)==1
        l(i,j)=((i-round(n/2))^2+(j-round(n/2))^2-r^2)<0;
      else
        l(i,j)=((i-n/2-0.5)^2+(j-n/2-0.5)^2-r^2)<0;
      end
    endfor
  endfor
  ret=l;
endfunction
