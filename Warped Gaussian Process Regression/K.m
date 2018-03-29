function  result = K( x1,x2 )
  %Kernel Function
  [a b] = size(x1);
  [c d] = size(x2);
%    r = 2*[1 2 1 10 2 1]; %2010
%    v0 = 100;
%    v1 = 1;
%   r = 2*[1 2 1 10 2 1];%2011 &2012
%    v0 = 100;
%    v1 = 10;
%    r = 2*ones(a,1);%2013
%    v0 = 100;
%    v1 = 1;
   r = 2*ones(a,1);%2014
   v0 = 1000;
   v1 = 1.1;
  result = zeros(b,d);
  for i = 1:b
      for j = 1:d
          %result(i,j) = sigma1*exp(-((norm(x1(:,i)-x2(:,j)))^2)/(2*sigma2^2));           %SE 
          flag1 = 0;
          for k = 1:a
              flag1 = flag1 + ((x1(k,i)-x2(k,j))/r(k))^2;
          end
          temp_result = v1*exp(-1/2*flag1);
          if(i==j)
              result(i,j) = temp_result + v0;
          else
              result(i,j) = temp_result;
          end
      end
  end  
end

