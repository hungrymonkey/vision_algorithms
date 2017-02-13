function [ gas ] = gauss_kernel( sig )
%GAUSS_KERNEL Summary of this function goes here
%   Detailed explanation goes here
sigma = sig;
[x,y] = meshgrid( -3*sigma:3*sigma, -3*sigma:3*sigma);
exponents = exp(-(x.^2 + y.^2)/(2*sigma^2));
gas = exponents/sum(exponents(:));

end

