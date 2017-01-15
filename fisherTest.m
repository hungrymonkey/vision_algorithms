function [ test_labels ] = fisherTest( trainset, trainlabels, testset, W, mu, k )
%FISHERTEST Summary of this function goes here
%   Detailed explanation goes here
u = W(1:k,:);
%train = trainset - repmat(mu, size(trainset,1),1 ); 
%test = testset - repmat(mu, size(testset,1),1 );

rot_train = cell2mat(arrayfun(@(n) ( u * (trainset(n,:)-mu)')', 1:size(trainset,1),'UniformOutput',false)');
rot_test = cell2mat(arrayfun(@(n) ( u * (testset(n,:)-mu)')', 1:size(testset,1),'UniformOutput',false)');
matches = k_nn(rot_train, rot_test, 1, 1);
test_labels = decode_train( matches, trainlabels );
end

