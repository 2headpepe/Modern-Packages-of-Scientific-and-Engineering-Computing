function ret = f4(n,m)
  if(exist("m")==0)
    m=n;
  end
  i=1;
  j=2;
  flag=0;
  tmpNum=2;
  ret = ones(n,m);
  ret(1,2)=2;

  while(i+j!=n+m),
    ret(i,j)=tmpNum;
    if(flag==0),
      i+=1;
      j-=1;
      tmpNum+=1;
      ret(i,j)=tmpNum;
      if(i==n),
        flag=1;
        tmpNum+=1;
        j+=1;
        ret(i,j)=tmpNum;
      end;
      if(j==1),
        flag=1;
        tmpNum+=1;
        i+=1;
        ret(i,j)=tmpNum;
      end;
    else
      i-=1;
      j+=1;
      tmpNum+=1;
      ret(i,j)=tmpNum;
      if(j==m),
        flag=0;
        tmpNum+=1;
        i+=1;
        ret(i,j)=tmpNum;
      end;
      if(i==1),
        flag=0;
        tmpNum+=1;
        j+=1;
        ret(i,j)=tmpNum;
      end;
    endif
  endwhile
##
##  res=zeros(n)
##  for i =1:n
##    if(mod(i,2)==1)
##      ret += diag(1:i,i-n)
##    else
##      ret += diag(i:-1:1,i-n)
##    end;
##  endfor


endfunction
