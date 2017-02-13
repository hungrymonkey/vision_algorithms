function [ pts, t ] = normalizeDLT( points )
%NORMALIZEDLT Summary of this function goes here
%   Detailed explanation goes here
x = points(:,1);
y = points(:,2);
u_x = mean(x);
u_y = mean(y);
[m,n] = size(points);

var_x = mean((u_x - x ).^2);
var_y = mean((u_y - y ).^2);
std = sqrt(var_x+var_y);

s = sqrt(2)/std;
t = [s,0,-u_x*s;0,s,-u_y*s;0,0,1];
normalize_pts = t*[points,ones(m,1)]';
pts = normalize_pts';
end

