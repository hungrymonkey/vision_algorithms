function [ output_args ] = nssd( p1, p2 )
%NSSD Summary of this function goes here
%   Detailed explanation goes here
m = ( p_tilda(p1) - p_tilda(p2)).^2;
output_args = sum(m(:));
end

