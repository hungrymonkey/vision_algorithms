function [ output_args ] = sparse_stereo( image1, image2, thresh, patchsize, sigma )
%SPARSE_STEREO Summary of this function goes here
%   Detailed explanation goes here
outpoints = [];

gas = gauss_kernel(sigma);
off = floor(patchsize/2);
img1 = image1;
img2 = image2;
%% check if black or white
if size(image1,3) == 1
%%img1 = conv2( image1, gas);
%%img2 = conv2( image2, gas'); 

img1_pts = corner_detect(image1, .04 ,sigma, 50);
img2_pts = corner_detect(image2, .04 ,sigma, 50);
for i = 1:size(img1_pts,1)
    pts1 = img1_pts(i,:);
    p1 = p_tilda(img1( pts1(2)-off:pts1(2)+off,  pts1(1)-off:pts1(1)+off));
    candidates = [];
    for j = 1:size(img2_pts,1)
        pts2 = img2_pts(j,:);
        p2 = p_tilda(img2( pts2(2)-off:pts2(2)+off,  pts2(1)-off:pts2(1)+off));
        p_til2 = (p1 - p2).^2;
        nssd = sum(p_til2(:));
        if( thresh > nssd )
            candidates = [candidates; [nssd, pts2]];
        end
    end
    if ~isempty(candidates)
        [val,idx]  = min(candidates(:,1) );
        outpoints = [outpoints; pts1,candidates(idx,2:3)];
    end
end
else
    img1_pts = corner_detect(rgb2gray(image1), .04 ,sigma, 50);
    img2_pts = corner_detect(rgb2gray(image2), .04 ,sigma, 50);
    for i = 1:size(img1_pts,1)
        pts1 = img1_pts(i,:);
        p1 = img1( pts1(2)-off:pts1(2)+off,  pts1(1)-off:pts1(1)+off, :);
        candidates = [];
        for j = 1:size(img2_pts,1)
            pts2 = img2_pts(j,:);
            p2 = img2( pts2(2)-off:pts2(2)+off,  pts2(1)-off:pts2(1)+off, :);
            nssd_ = nssd_color(p1,p2);
            if( thresh > nssd_ )
                candidates = [candidates; [nssd_, pts2]];
            end
        end
        if ~isempty(candidates)
            [val,idx]  = min(candidates(:,1) );
            outpoints = [outpoints; pts1,candidates(idx,2:3)];
        end
    end
end
output_args = outpoints;
end

