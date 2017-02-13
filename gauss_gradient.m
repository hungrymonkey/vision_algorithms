function [ ix, iy ] = gauss_gradient( img, sig )
%GAUSS_BLUR Summary of this function goes here
%   multiply sigma by 3 as explained in the hw
gas = gauss_kernel(sig);

conv_kernel = [ -1/2, 0, 1/2];
guassimg = conv2( img, gas, 'same');
%fx = conv2(gas, conv_kernel);
%fy = conv2(gas, conv_kernel');

ix = conv2( guassimg, conv_kernel,'same');
iy = conv2( guassimg, conv_kernel','same');
end

