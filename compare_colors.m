clc; clear; close all;
whitebg('w'); colormap('gray'); plottools('off');

vFilenames = { 'exp' 'noexp' 'resize' };
vImage = cell(3,1);
for i = 1:3
	vImage{i} = double(imread([vFilenames{i} '.png']));	% load the images using the filenames above
	vImage{i} = vImage{i}(1,:,:);					% use only the first row, since rows are identical
	vImage{i} = squeeze( vImage{i} );				% convert 3d matrix with one row into 2d with image_width rows and 3 (rgb) columns
	vImage{i} = vImage{i}';						% transpose, 3 (rgb) rows and image_width columns
end


%%
clc
vColormap = hsv(3);	% hsv colormap for lines in plot, no connection to images, 5 for best colors

vDist = cell(3,1);
vHist = cell(3,1);
figure(1); clf; hold on;		% clear and hold the histogram figure for later
for i = 1:3
	j = mod(i,3)+1; % keep j pointed to next vector, then wrap it back to 1
	vDist{i} = sqrt( sum( (vImage{i} - vImage{j}).^2 ) );
	
	vHist{i} = histc(vDist{i}, linspace(0, 40, 20));
	plot(vHist{i}, 'Color', vColormap(i,:), ...
		'DisplayName', [ vFilenames{i} ' - ' vFilenames{j} ])	% Display stuff
end
legend show;
title('Distance Distributions');
saveas(gcf,'Distance Distributions.png');


%% Plot all of the pixels in one 3d space in different colors

figure(2); clf; hold on;
for i = 1:3
	scatter3(vImage{i}(1,:), vImage{i}(2,:), vImage{i}(3,:), ...
		15, vColormap(i,:), 'filled', 'DisplayName', vFilenames{i});	% Display stuff
	view(17,5);
end
legend(vFilenames);
title('3d Distances');
saveas(gcf,'3d Distances.png');
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
