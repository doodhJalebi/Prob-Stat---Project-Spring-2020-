% Task 2: 1D Random Walk with two people

clear all;
close all;

number_of_steps = 1000;
number_of_simulations = 100;

p_right = 0.5;
p_static = 0;
p_left = 1 - p_right - p_static;

pickA = 0;
pickB = 0;

meeting_points_average = zeros(1, 100);

for a = 1:100
    
    fprintf('Distance between A and B = %d\n', a);
    meeting_points(1) = 0;
    
    for x = 1:number_of_simulations
        fprintf('Simulation %d/%d\n', x, number_of_simulations);
        
        positionA = 0;
        positionB = a;
        
        for i = 1:number_of_steps

            pickA = randsrc(1,1,[1,0,-1;p_right,p_static,p_left]);
            pickB = randsrc(1,1,[1,0,-1;p_right,p_static,p_left]);

            positionA = positionA + pickA;

            positionB = positionB + pickB;

            if (positionA == positionB)
                meeting_points(x) = i;
                fprintf('A and B met after %d steps.\n', i);
                break
            end

        end
    end
    
    meeting_points_average(a) = mean(meeting_points);
end

plot(1:100, meeting_points_average);
