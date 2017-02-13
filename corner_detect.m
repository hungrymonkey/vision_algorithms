function [ output_args ] = corner_detect(  img, threshold, sigma, numpoints )
%CORNER_DETECT Summary of this function goes here
%   Detailed explanation goes here
%% create gradient imgs
[ix, iy ] = gauss_gradient(img, sigma );

%%% create circular roi
w_size = sigma* 2 * 3 + 1;

r = sigma * 3+1;
center = [r,r];
[w,h] = meshgrid(1:w_size,1:w_size);
w = sqrt((w-center(1)).^2 + (h-center(2)).^2) < r;
w = double(w);



a = conv2( ix.^2, w, 'same');
b = conv2( iy.^2, w, 'same');
c = conv2( ix.*iy, w, 'same');
eigen_roi = zeros(size(img));
%%Do no calculate 25 pixels from the sides, the chances are they are all
%%false positives
for i = 22:size(a,1)-22
    for j = 22:size(a,2)-22
        cx = [a(i,j), c(i,j); c(i,j), b(i,j)];
        e = eig(cx);
        %%% since min is the smaller use it as a test to see if both are
        %%% large
        if min(e) > threshold
            eigen_roi(i,j) = min(e);
        end
    end
end
%%% find local maxima

[row,col,v] = find(find_maximas(eigen_roi));
% negative v because I want descending order
sortedpks = sortrows([-v,col,row]);
output_args = sortedpks(1:min(numpoints,size(sortedpks,1)),2:3);
end

