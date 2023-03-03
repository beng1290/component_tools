%% prepare_image
% increases the resolution by up sampling. 

function vq = prepare_image(imi, smp)
%
% select the cell
cc = {650:875};
cc2 = {1015:1300};
%
imo = imi(cc{1},cc2{1},:);
%
% increase the resolution on the color image
%
F = griddedInterpolant(double(imo));
F.Method = 'spline';
%
[sx,sy,sz] = size(imo);
xq = (0:5/smp:sx)';
yq = (0:5/smp:sy)';
zq = (1:sz)';
vq = uint8(F({xq,yq,zq}));
%
end