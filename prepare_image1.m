% for image number 1
function vq = prepare_image1(imi,H,W, ss)
%
imi = reshape(imi,H,W,3);
%
% select the cell
%
imo = imi(760:780,1112:1132,:);
%
% increase the resolution
%
F = griddedInterpolant(double(imo));
F.Method = 'spline';
%
[sx,sy,sz] = size(imo);
xq = (0:5/ss:sx)';
yq = (0:5/ss:sy)';
zq = (1:sz)';
vq = uint8(F({xq,yq,zq}));
end