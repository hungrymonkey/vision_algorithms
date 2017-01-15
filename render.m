%%render function
function out = render( albedo, normalx,normaly,normalz, light, intensity, points)

%% create xyz matrixes. Matlab optimization
lightx = ones(size(points))*light(1);
lighty = ones(size(points))*light(2);
lightz = ones(size(points))*light(3);
x = meshgrid(1:size(points,2),1:size(points,1));
y = meshgrid(1:size(points,1),1:size(points,2)).';

%%light vectors
lightx_vec = lightx-x;
lighty_vec = lighty-y;
lightz_vec = lightz-points;
%% dot product between light source and surface normal
dot_norm_light = lightx_vec .* normalx +  lighty_vec .*normaly+  lightz_vec .* normalz;

%% distance formula
distance = (lightx - x).^2 +  (lighty - y).^2 + (lightz - points).^2;
tmp = dot_norm_light .* intensity;
tmp2 = albedo  .* (tmp > 0) .* tmp ./distance;
output = zeros(size(tmp2));
output(tmp2>0) = tmp2(tmp2>0);
out = output;
%%out(out<0) = 0;
end