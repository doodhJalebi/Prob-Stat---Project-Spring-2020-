% Random walk inside circle
clc;
close all;
clear;

stepsPerWalk = 10000;
numberOfWalks = 500;
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
%         angleArray = [0,(pi/2),pi,(3*pi/2),(720/pi),(900/pi),(1080/pi)];
        angleArray = [0,90,180,270];
        angle = degtorad(angleArray(randi(length(angleArray))));
        stepSizeArray = [0,0.5,1];
        stepSize = stepSizeArray(randi(length(stepSizeArray)));
		if angle < 90
            dist_rad=sqrt((x_t(n) + stepSize*sin(angle))^2+(y_t(n) + stepSize*cos(angle))^2);
            if dist_rad<100
                x_t(n+1) = x_t(n) + stepSize*sin(angle);
                y_t(n+1) = y_t(n) + stepSize*cos(angle);
            else
                x_t(n+1)=x_t(n);
                y_t(n+1)=y_t(n);
            end
        elseif angle >=90 && angle < 180
            dist_rad=sqrt((x_t(n) + stepSize*cos(angle-90))^2+(y_t(n) - stepSize*sin(angle-90))^2);
            if dist_rad<100
                x_t(n+1) = x_t(n) + stepSize*cos(angle-90);
                y_t(n+1) = y_t(n) - stepSize*sin(angle-90);
            else
                x_t(n+1)=x_t(n);
                y_t(n+1)=y_t(n);
            end
        elseif angle >=180 && angle < 270
			dist_rad=sqrt((x_t(n) - stepSize*cos(angle-180))^2+(y_t(n) - stepSize*sin(angle-180))^2);
            if dist_rad<100
                x_t(n+1) = x_t(n) - stepSize*cos(angle-180);
                y_t(n+1) = y_t(n) - stepSize*sin(angle-180);
            else
                x_t(n+1)=x_t(n);
                y_t(n+1)=y_t(n);
            end
            
        elseif angle >=270 && angle < 360
            dist_rad=sqrt((x_t(n) - stepSize*cos(angle-270))^2+(y_t(n) + stepSize*sin(angle-270))^2);
            if dist_rad<100
                x_t(n+1) = x_t(n) - stepSize*cos(angle-270);
                y_t(n+1) = y_t(n) + stepSize*sin(angle-270);
            else
                x_t(n+1)=x_t(n);
                y_t(n+1)=y_t(n);
            end
        end
	end
	plot(x_t, y_t, 'LineWidth', 2);
	hold on
	drawnow;
end
grid on;
