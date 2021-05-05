%% define_colors
% define color maps for different variations of image display
% Benjamin Green - Johns Hopkins 03.20.2021
%% ------------------------------------------
function mycol = def_colors()
%
mycol.all = [0 0 1;
    0 1 0;
    1 1 0;
    1 0 0;
    0.91 0.41 0.17;
    0 1 1;
    1 0 1
    0 0 0];
    %
mycol.cd8 = [0 0 0;
        0 0 0;
        1 1 0;
        0 0 0;
        0 0 0;
        0 0 0;
        0 0 0;
        0 0 0];    
mycol.cd163 = [0 0 0;
        0 0 0;
        0 0 0;
        0 0 0;
        0 0 0;
        0 0 0;
        1 0 1;
        0 0 0];    
 mycol.foxp3 = [0 0 0;
        0 0 0;
        0 0 0;
        1 0 0;
        0 0 0;
        0 0 0;
        0 0 0;
        0 0 0];
mycol.tumor = [0 0 0;
        0 0 0;
        0 0 0;
        0 0 0;
        1 0.549 0;
        0 0 0;
        0 0 0;
        0 0 0];      
%
% for markers
% Other, CD8, CD163, FoxP3, Tumor
%
mycol.linmarkers = [0 0 1;
    1 1 0;
    1 0 0;
    0.91 0.41 0.17;
    1 0 1];  
mycol.expr = [0 1 0;
    0 1 1];  
mycol.dapi = [0 0 1;
    0 0 0;
    0 0 0;
    0 0 0;
    0 0 0;
    0 0 0;
    0 0 0;
    0 0 0]; 

end