% Task 1: 1D Random Walk

clear all;
close all;

number_of_simulations = 100;
number_of_steps = 1000;

p_right = 0.5;
p_static = 0.0;
p_left = 0.5;

averages = zeros(10, number_of_steps);

for counter = 1:10
   distances = zeros(number_of_simulations, number_of_steps);

    for x = 1:number_of_simulations
        position = 0;

        %zero_line(1:number_of_steps) = position;

        pick = 0;
        right = 0;
        left = 0;

        moves(1:number_of_steps) = 0;

        for i = 1:number_of_steps

            pick = randsrc(1,1,[1,0,-1;p_right,p_static,p_left]);
            position = position + pick;
            moves(i) = position;

            if (pick == 1)
                right = right + 1;
            elseif (pick == -1)
                left = left + 1;
            end

        end

        %fprintf('Position: %d\n', position);
        %fprintf('Right: %d\n', right);
        %fprintf('Left: %d\n', left);

        %plot(1:number_of_steps, moves, 1:number_of_steps,zero_line,'--');

        distances(x,:) = moves;
    end
    %plot(1:100, distances);

    for i = 1:number_of_steps
       averages(counter,i) = mean(distances(:,i));
    end

end

x_axis = 1:number_of_steps;

%plot(x_axis, averages(1,:), x_axis, averages(2,:), x_axis, averages(3,:), x_axis, averages(4,:), x_axis, averages(5,:));

plot(x_axis, std(averages));
