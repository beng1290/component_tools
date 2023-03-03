function [wd, folder, xcoord, ycoord, mycol, markers, ...
    vals, vals2] = setupvars()
% 
% get the image names
%
%
wd = '\\bki-fs1\data02\Clinical_Specimen_2';
folder = {'L12_1'};
xcoord = [51721];
ycoord = [10358];
%
mycol = define_colors();
markers = {'Other','PDL1','CD8','FoxP3','Tumor','PD1','CD163'};
%
% scaling for different colors in the image
% 
vals = 200;
vals2 = 1.25;
%
% position of different panels
%
pos{1} = [.3775 .655 .245 .245];
%
end