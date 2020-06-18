% Random walk inside circle using continuous random variables
clc;
close all;
clear;

stepsPerWalk = [];
numberOfWalks = 10;

% Plotting a circle
startingXpos = 0;
startingYpos = 0;
radius = 100;
diameter = radius*2;
px = startingXpos - radius;
py = startingYpos - radius;


for j= 1 : 10 %change to number of different positions u want
    fprintf('Randomly selecting initial positions...%d/10\n', j);
    angle1=degtorad(360*rand(1));
    angle2=degtorad(360*rand(1));
    pos1=100*rand(1);
    pos2=100*rand(1);
    x_t_1(1)=pos1*sin(angle1);
    y_t_1(1)=pos1*cos(angle1);
    x_t_2(1)=pos2*sin(angle2);
    y_t_2(1)=pos2*cos(angle2);
    n=1;
    starting_distance(j)=sqrt((x_t_1(n)-x_t_2(n))^2+(y_t_1(n)-y_t_2(n))^2);
    for m = 1 : numberOfWalks
        fprintf('Simulation %d/%d\n', m, numberOfWalks);
        n= 1;
        while sqrt((x_t_1(n)-x_t_2(n))^2+(y_t_1(n)-y_t_2(n))^2)>=1
            
            ang1 = degtorad(360*rand(1));
            stepSize1 = 1*rand(1);
            dist_rad_1=sqrt((x_t_1(n) + stepSize1*sin(ang1))^2+(y_t_1(n) + stepSize1*cos(ang1))^2);
            if dist_rad_1<100
                x_t_1(n+1) = x_t_1(n) + stepSize1*sin(ang1);
                y_t_1(n+1) = y_t_1(n) + stepSize1*cos(ang1);
            else
                x_t_1(n+1)=x_t_1(n);
                y_t_1(n+1)=y_t_1(n);
            end

            ang2 = degtorad(360*rand(1));
            stepSize2 = 1*rand(1);
            dist_rad_2=sqrt((x_t_2(n) + stepSize2*sin(ang2))^2+(y_t_2(n) + stepSize2*cos(ang2))^2);
            if dist_rad_2<100
                x_t_2(n+1) = x_t_2(n) + stepSize2*sin(ang2);
                y_t_2(n+1) = y_t_2(n) + stepSize2*cos(ang2);
            else
                x_t_2(n+1)=x_t_2(n);
                y_t_2(n+1)=y_t_2(n);
            end
            n=n+1;
        end
        
        stepsPerWalk(m)=n;
        %plot(x_t_1, y_t_1, 'LineWidth', 2);
        %plot(x_t_2,y_t_2,'LineWidth',2);

        x_t_1=[x_t_1(1)];
        y_t_1=[y_t_1(1)];
        x_t_2=[x_t_2(1)];
        y_t_2=[y_t_2(1)];
        
    end
    
    meansteps(j)=mean(stepsPerWalk);
    
end

hold on
drawnow;
grid on
rectangle('Position',[px, py, diameter, diameter],'Curvature',[1 1])
axis square;
hold on;
plot(starting_distance,meansteps);
