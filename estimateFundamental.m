function [ output_args ] = estimateFundamental( cor1, cor2 )
%ESTIMATEFUNDEMENTAL Summary of this function goes here
%   Detailed explanation goes here
[m,n] = size(cor1);
[cor1_hom, t1] = normalizeDLT(cor1);
[cor2_hom, t2] = normalizeDLT(cor2);

%cor1_hom = [cor1,ones(m,1)];
%cor2_hom = [cor2,ones(m,1)];
a = zeros(m, 9);
for i = 1:m
    a(i,:) = kron(cor1_hom(i,:),cor2_hom(i,:));
end
[u,s,v] = svd(a,0);

%%% I was stuck here since V^T was confusing me
f = v(:,end); 
f = reshape(f,[3,3])';

output_args = t2' *  f * t1;
end

