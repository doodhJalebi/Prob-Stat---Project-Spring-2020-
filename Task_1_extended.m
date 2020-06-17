% Task 1: 1D Random Walk

clear all;
close all;

number_of_steps = 1000;
p_right = 0.4;
p_static = 0.2;
p_left = 1 - p_right - p_static;

distances(1:100) = 0;

for x = 1:100
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
    
    distances(x) = position;
end
plot(1:100, distances);