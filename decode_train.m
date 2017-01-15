function [ output_args ] = decode_train( neighbors, labels )
%DECODE Summary of this function goes here
%   Detailed explanation goes here
output_args = arrayfun( @(n) labels(n), neighbors);

end

