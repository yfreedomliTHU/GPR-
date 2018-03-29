function  result = K( x1,x2 )
  %Kernel Function
  [a b] = size(x1);
  [c d] = size(x2);
  %SE
  %sigma1 = 1.2;%2010
  %sigma1 = 1.2;%2011
  sigma1 = 1;%2012
  %sigma1 = 1.2;%2013
  %sigma1 = 1.3; %2014
  %sigma2 = 142;%2010
  %sigma2 = 180;%2011
  sigma2 = 150;%2012
  %sigma2 = 183;%2013
  %sigma2 = 200;%2014
  %sigma1 = 1.5;
  %sigma2 = 183
  
  %PER
%   sigma = 1.5;
%   p = 110;
%   l=9;

  %LIN
%   sigma_b =100;
%   sigma_v =50;
%   L = ones(a,1);

  %RQ
%   SIGMA = 1;
%   alpha = 100;
%   l2 = 150;
  result = zeros(b,d);
  for i = 1:b
      for j = 1:d
          result(i,j) = sigma1*exp(-((norm(x1(:,i)-x2(:,j)))^2)/(2*sigma2^2));           %SE 
          %result(i,j) = sigma^2*exp(-2*((norm(sin(pi/p*(x1(:,i)-x2(:,j)))))^2)/(l^2));   %PER
          %result(i,j) = sigma_b^2 + sigma_v^2 *((x1(:,i)-L)'*(x2(:,j)-L));  %LIN
          %result(i,j) = SIGMA^2*(1+norm(x1(:,i)-x2(:,j))^2/(2*alpha*(l2^2)))^(-alpha);       %RQ
      end
  end  
end

