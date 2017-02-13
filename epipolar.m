function [ output_args ] = epipolar( f , x )
%EPIPOLAR Summary of this function goes here
%   Detailed explanation goes here
tmp = f * x;
%%homoize results
output_args = tmp/tmp(end); 

end

