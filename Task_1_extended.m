% Task 1: 1D Random Walk

clear all;
close all;

number_of_steps = 1000;
number_of_simulations = 100;

p_right = 0.5;
p_static = 0.0;
p_left = 0.5;

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
averages = zeros(1, number_of_steps);

for i = 1:number_of_steps
   averages(i) = mean(distances(:,i));
end

plot(1:1000, averages);