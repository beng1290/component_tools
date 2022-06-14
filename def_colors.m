%% define_colors
% define color maps for different variations of image display
% Benjamin Green - Johns Hopkins 03.20.2021
%% ------------------------------------------
function mycol = def_colors(l)
%
if l <= 7
    %%blue%green%yellow%red%orange%cyan%magenta%black%%
    mycolab = [0 1 0;
        1 1 0;
        1 0 0;
        0.91 0.41 0.17;
        0 1 1;
        1 0 1;];
    mycol.all = [0 0 1;
        mycolab(1:l-2, :);
        0 0 0];
    %
elseif l <= 10 && l > 7
    %%blue%coral%green%yellow%red%orange%cyan%magenta%white%black%%
    mycolab = [1 .7529 .7961;
        0 1 0;
        1 1 0;
        1 0 0;
        0.91 0.41 0.17;
        0 1 1;
        1 0 1;
        .7 .7 .7;];
    mycol.all = [0 0 1;
        mycolab(1:l-2, :);
        0 0 0];
    %
     mycolab = [0 0 0;
        0 0 0;
        0 0 0;
        0 0 0;
        0 0 0;
        0 0 0;
        0 0 0;
        .9 .9 .9;];
    mycol.all = [0 0 1;
        mycolab(1:l-2, :);
        0 0 0];
    %
else
    mycol.all = [];
end
%
end