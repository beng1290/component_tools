function create_figure_1_multiplex()
%%
%% ---------------------------------------------------
% prepare the images for segmentation error figures
% in the methods paper
%% ---------------------------------------------------
%
[wd, folder, xcoord, ycoord, mycol, markers,...
    vals, vals2] = setupvars();
%
smp = 5;
%
[im] = myimread(wd, folder{1}, xcoord, ycoord);
%
im_cc = add_color(im, mycol, 1, vals, vals2); % full color image
im_cc2 = imrotate(im_cc, 180);
%
vq_m = prepare_image(im_cc, smp);
[vq_m] = scale_bar(vq_m, 25, .5, smp/5);
XX = create_fig();
imshow(uint8(vq_m))
%
%print(XX,'figure_image_1_multiplex.png','-dpng','-r780', '-cmyk')
%close all
%
end
        
        
