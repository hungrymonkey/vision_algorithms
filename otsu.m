%% using the paper http://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=4310076
function [out] = otsu( img )
nbins = 256;
img_double = im2double(img);
[counts, centers] = hist(img_double, nbins);
%%pi = ni/N
p = counts/sum(counts);
sig = zeros(nbins);
for t = 1:nbins
   w_0 = sum( p(1:t));
   w_1 = sum( p(t+1:end));
   u_0 = sum( p(1:t) .* ( 1:t )') /w_0;
   u_1 = sum( p(t+1:end) .* ( t+1:nbins )') /w_1;
   sig(t) = w_0 * w_1 * ( u_0 - u_1 )^2;
end
   [val,thresh] = max(sig(:));

   out = img > thresh;
end