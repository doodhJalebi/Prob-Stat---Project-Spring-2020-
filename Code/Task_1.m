% Task 1: 1D Random Walk

clear all;
close all;

number_of_steps = input('Enter number of steps: ');
p_right = input('Enter probability of moving right: ');
p_static = input('Enter probability of not moving: ');
p_left = 1 - p_right - p_static;

position = input('Enter starting position: ');

zero_line(1:number_of_steps) = position;

pick = 0;
right = 0;
left = 0;

moves(1:number_of_steps) = 0;

for i = 1:number_of_steps
    
    pick = randsrc(1,1,[1,0,-1;p_right,p_static,p_left]);
    moves(i) = position + pick;
    position = position + pick;
    
    if (pick == 1)
        right = right + 1;
    elseif (pick == -1)
        left = left + 1;
    end
    
end

fprintf('Position: %d\n', position);
fprintf('Right: %d\n', right);
fprintf('Left: %d\n', left);

plot(1:number_of_steps, moves, 1:number_of_steps,zero_line,'--');