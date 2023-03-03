%% create_fig
% create a figure with desired settings
function XX = create_fig()
XX = figure('visible' , 'on', 'NumberTitle', 'off');
XX.Resize = 'off';
set(gcf, 'units','normalized','outerposition',[0 0 1 1],...
    'PaperUnits','inches');
set(XX, 'PaperOrientation','landscape','PaperSize',[20 12]);
end