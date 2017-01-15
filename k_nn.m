function [ output_args ] = k_nn( trainset, test, k, norm )
%K_NN Summary of this function goes here
%   Detailed explanation goes here

output_args = cell2mat(arrayfun(@(n) nearest_neighbor( trainset, test(n,:), k, norm), 1:size(test,1),'UniformOutput',false)');
end

