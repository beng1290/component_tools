% for image number 2
function vq = prepare_image2(imi,H,W,ss)
%
imi = reshape(imi,H,W,3);
%
% select the cell
%
imo = imi(897:920,189:215,:);
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