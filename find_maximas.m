function [ output_args ] = find_maximas( img )
%FIND_MAXIUMS Summary of this function goes here
%   Detailed explanation goes here

%%%% really naive local maxima ignore sides of the image

out_img = zeros(size(img));
for i = 2:size(img,1)-1
    for j = 2:size(img,2)-1
        roi = img(i-1:i+1,j-1:j+1);
        pk = roi(2,2);
        roi(2,2) = 0;
        if pk > max(roi(:))
            out_img(i,j) = pk;
        end
    end
end
output_args = out_img;
end

