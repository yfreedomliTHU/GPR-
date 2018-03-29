function  result = K( x1,x2 )
  %Kernel Function
  [a b] = size(x1);
  [c d] = size(x2);
%    sigma1 = 1.2; %2010
%    sigma2 = 140;
%    sigma_D = 1;
%    sigma1 = 1.2;   %2011
%    sigma2 = 180;
%    sigma_D = 1;
%    sigma1 = 1.2;   %2012
%    sigma2 = 165;
%    sigma_D = 0.9;
%    sigma1 = 1.2;   %2013
%    sigma2 = 183;
%    sigma_D = 1;
   sigma1 = 1.2;   %2014
   sigma2 = 200;
   sigma_D = 1;
  result = zeros(b,d);
  for i = 1:b
      for j = 1:d
          temp_result = 1;
          for k = 1:a
             temp_result = temp_result*(sigma1*exp(-((x1(k,i)-x2(k,j))^2)/(2*sigma2^2)));
          end 
          result(i,j) = sigma_D^2*temp_result;
      end
  end  
end

