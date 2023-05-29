function res = f5(n,min,max),
  res=rand(n)
  res*=(max-min)
  res+=min
  res-=mod(res,1)
endfunction
