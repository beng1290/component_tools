%% show_tissue_regions
% show the full color image, then tumor overlay (red), stroma (green),
% blank(blue) in subsequent images (note blank is hard to see on the last
% image)
%% -----------------------------------------------------
function show_tissue_regions(wd, folder, imname)
%
% image
%
if (nargin < 1)
    wd = '\\halo1\TaubeLab\seg_comparisons';
    folder = 'SegmentationImages';
    imname = 'Melanoma_TMA_1287_40_01.30.2020_[6327,55511]_component_data_w_seg.TIF';
end
%
[im, h, w, l] = myimread(wd, folder, imname);
mycol = def_colors(l);     
%
% add color to the image 
%
imc = add_color(im, mycol, h, w);
%
figure()
imshow(uint8(imc)); shg
%
% get the different tissue layers and display those overtop
%
impath = [wd,'\',folder,'\inform_data\Component_Tiffs'];
full_image_name = fullfile(impath,imname);
%
imt = imread(full_image_name, l+1);
imb = zeros(size(imc));
%{
for i1 = 0:1
    %
    % get the layer of interest (0:Good Tissue; 1:Blank) -- note this
    % information is not always consistent. That information is not kept in
    % w_seg tiffs
    %
    ii = imt == i1;
    imt2 = repmat(ii, 1, 1, 3);
    ind = find(imt2);
    %
    % create a solid color mask
    %
    ima = imb;
    ima(:,:,i1+1) = 255;
    %
    % combine images with alpha blend of a
    %
    a = .4;
    imc2 = imc;
    imc2(ind) = imc(ind) * (1-a) +  a .* ima(ind);
    figure()
    imshow(uint8(imc2)); shg
end
%}
end