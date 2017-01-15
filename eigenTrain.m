function [ W, mu ] = eigenTrain( trainset, k )
%EIGENTRAIN Summary of this function goes here
%   Detailed explanation goes here
d = mean(trainset,1);
x_hat = trainset - repmat(d, size(trainset,1),1 );
sigma = x_hat' * x_hat / size(x_hat, 1);

[u,s,v] = svd(sigma);
%clear_idx = 21:min(size(s,1),size(s,2));
%s(sub2ind(size(s), clear_idx,clear_idx)) = 0;
%eigen = diag(s);
%W = repmat(eigen(1:k), 1, size(trainset,2))';
W=u(:,1:k)';
mu = d;
end

