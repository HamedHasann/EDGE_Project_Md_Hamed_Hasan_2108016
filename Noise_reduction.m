numPoints = 10000;
xy = rand(numPoints, 2) * 6 - 3;
z = peaks(xy(:, 1), xy(:, 2)) + 0.5 - rand(numPoints, 1);
dataPoints = [xy, z];

figure;
plot3(dataPoints(:, 1), dataPoints(:, 2), dataPoints(:, 3), '.');
view(-28, 32);

tolerance = 0.3;
dataScale = [1, 1, Inf];
[uniquePoints, pointGroups] = uniquetol(dataPoints, tolerance, ...
    'ByRows', true, 'OutputAllIndices', true, 'DataScale', dataScale);

averagedPoints = zeros(length(pointGroups), 3);
for k = 1:length(pointGroups)
    averagedPoints(k, :) = mean(dataPoints(pointGroups{k}, :), 1);
end

hold on;
plot3(averagedPoints(:, 1), averagedPoints(:, 2), averagedPoints(:, 3), ...
    '.r', 'MarkerSize', 15);
hold off;