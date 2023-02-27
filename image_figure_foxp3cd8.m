%% image_figure_foxp3cd8
% images for the foxp3cd8 example
%% ---------------------------------------
function image_figure_foxp3cd8()
%
wd = '\\bki04\Clinical_Specimen';
%
folder = {'M56_1','M3_1','M25_1'};
xcoord = [43024 51726 48120];
ycoord = [12502 13443 6107];
include_dapi = 1; %logical (1) yes, (2) no
ss= 15; % pixel resampling (*15)
%
% defines color vectors;can be edited but default are normal saturated
%
[mycol] = foxp3cd8_colors();
%
for im_count = 1:length(xcoord)
    %
    % minor color edits for version 2
    % text labels commented out below and not used 
    %
    if im_count == 2
        dapi = 3;
        color_scale = 2;
        text_size = 10; 
    else
        dapi =2;
        color_scale = 3;
        text_size = 11;
    end
    %
    [im] = myimread(wd, folder{im_count}, xcoord(im_count), ycoord(im_count));
    %
    XX = figure();
    %
    % 570 (FoxP3, red)
    %
    [im2] = foxp3cd8_add_color(im, mycol, color_scale, include_dapi, 2, dapi);
    %
    % each prepare image cuts out a different region with coordinates
    % defined in the function themselves 
    %
    if im_count == 1
        vq = prepare_image1(im2,1004,1344, ss);
    elseif im_count == 2
        vq = prepare_image2(im2,1004,1344, ss);
    elseif im_count == 3
        vq = prepare_image3(im2,1004,1344, ss);
    end
    % comment out to remove
    [vq] = scale_bar(vq , 5, .5, ss/5);
    %
    s= size(vq);
    %{
    vq = insertText(vq, [0, s(1)], 'FoxP3',...
    'BoxColor',[0, 0, 0], 'TextColor', [255,0,0],...
    'BoxOpacity',0, 'FontSize', text_size, 'Font','Arial Bold'...
    ,'AnchorPoint','LeftBottom');
    %}
    %
    % display
    %
    subplot(2,1,2)
    imshow(uint8(vq));
    %
    % 540 (CD8, yellow)
    % 
    [im2] = foxp3cd8_add_color(im, mycol, color_scale, include_dapi, 1, dapi);
    %
    % each prepare image cuts out a different region with coordinates
    % defined in the function themselves 
    %
    if im_count == 1
        vq = prepare_image1(im2,1004,1344,ss);
    elseif im_count == 2
        vq = prepare_image2(im2,1004,1344,ss);
    elseif im_count == 3
        vq = prepare_image3(im2,1004,1344,ss);
    end
     %
    %[vq] = scale_bar(vq , 5, .5, ss/5);
    %
    s= size(vq);
    %{
    vq = insertText(vq, [0, s(1)], 'CD8',...
    'BoxColor',[0, 0, 0], 'TextColor', [255,255,0],...
    'BoxOpacity',0, 'FontSize', text_size, 'Font','Arial Bold'...
    ,'AnchorPoint','LeftBottom');
    %}
    %
    % display
    %
    subplot(2,1,1)
    imshow(uint8(vq));
    if include_dapi == 1
        print(XX, ['figure_4_image_foxp3cd8_cell_',num2str(im_count),'.png'],'-dpng','-r780', '-cmyk')    
    else
        print(XX, ['figure_4_image_foxp3cd8_cell_',num2str(im_count),'_nodapi.png'],'-dpng','-r780', '-cmyk')
    end
end
end
