function ret = f4_new(n)
  ret=zeros(n)
  count = 1
  for i =1:n
    if(mod(i,2)==1)
      ret += diag(count:count+i,n/2-i)
    else
      ret += diag(count+i:-1:count+1,n/2-i)
    end;
    count+=1
  endfor
endfunction
