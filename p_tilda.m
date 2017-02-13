function [ output_args ] = p_tilda( patch )
%P_TILDA Summary of this function goes here
%   Detailed explanation goes here
m = mean(patch(:));
k = (patch - m);
a = k.^2;
sig = sum(a(:))/numel(patch);
output_args = k/sig;
end

