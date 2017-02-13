function [ output_args ] = nssd_color( patch1, patch2 )
%EPIPOLAR Summary of this function goes here
%   Detailed explanation goes here

p1_r = patch1(:,:,1);
p1_g = patch1(:,:,2);
p1_b = patch1(:,:,3);

p2_r = patch2(:,:,1);
p2_g = patch2(:,:,2);
p2_b = patch2(:,:,3);
output_args = max( [nssd( p1_r, p2_r ),nssd( p1_g, p2_g ),nssd( p1_b, p2_b )]);

end
