% Random walk inside circle using discrete and continuous random variables

clc;
close all;
clear;

stepsPerWalk = 10000;
numberOfWalks = 100;
x_t(1) = 0;
y_t(1) = 0;

% Plotting a circle
startingXpos = 0;
startingYpos = 0;
radius = 100;
diameter = radius*2;
px = startingXpos - radius;
py = startingYpos - radius;
rectangle('Position',[px, py, diameter, diameter],'Curvature',[1 1])
axis square;
hold on;

% Random walk
for m = 1 : numberOfWalks
	for n = 1 : stepsPerWalk
        angle = degtorad(360*rand(1));
        stepSizeArray = [0,0.5,1];
        stepSize = stepSizeArray(randi(length(stepSizeArray)));
        dist_rad = sqrt((x_t(n) + stepSize*sin(angle))^2+(y_t(n) + stepSize*cos(angle))^2);
        if dist_rad<100
            x_t(n+1) = x_t(n) + stepSize*sin(angle);
            y_t(n+1) = y_t(n) + stepSize*cos(angle);
        else
            x_t(n+1)=x_t(n);
            y_t(n+1)=y_t(n);
        end
	end
	plot(x_t, y_t, 'LineWidth', 2);
	hold on
	drawnow;
end
grid on;
