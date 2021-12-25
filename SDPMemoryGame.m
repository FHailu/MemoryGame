clc 
clear

%% Creating the Memory Board

%This part of the script creates the board, where the pairs are randomized
GiantArray = [1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8];
random = randperm(16);
newArray = zeros(4, 4);

k = 1;
while k <= 16
    for x = [1:4]
        for y = [1:4]
            newArray(x, y) = GiantArray(random(k));
            k = k + 1;
        end
    end
end

%% Everything else

%Initializing for the while loop (paircount). Also the reference
%(choosingArray) for the spots on the actual table (newArray) can be used to select
%values. A timer is started here so that the time it takes for the player
%to win the game will be shown at the end.

choosingArray = [1 5 9 13; 2 6 10 14; 3 7 11 15; 4 8 12 16]
pairCount = 0;
tic;

while pairCount ~= 8
    
    %Section where the player inputs their data and we display it. The
    %display will help the player keep track of the previous uncovered
    %values. They can use that information later when they think they find
    %a pair.
    
    firstChoice = input('Choose one number, 1-16, from the table. Do not enter a non integer, negative value, or a zero.: ');
    secondChoice = input('Choose a different second number, 1-16, from the table: ');
    fprintf('\n The first value you uncovered was %i, the second was %i \n', newArray(firstChoice), newArray(secondChoice))
    
    %This section determines if the uncovered values are a pair
    if newArray(firstChoice) == newArray(secondChoice)
        if choosingArray(firstChoice) == 0 && choosingArray(secondChoice) == 0
            
            %This is to ensure they don't attempt to continue to uncover a
            %pair they already uncovered. This will make sure the pair
            %count doesn't increase when doing this. 
            
            fprintf('\n You''ve already found that pair and both spots have been replaced with a zero, choose again! \n')
        else
            
            %To show that two pairs have been found, the corresponding
            %spots of the choosing array are replaced by zeroes. This helps
            %the player keep track of what they've already chosen. The pair
            %count is also updated.
            
            fprintf('\n Good job, you have found one match! You''re one step closer to victory \n')
            choosingArray(firstChoice) = 0;
            choosingArray(secondChoice) = 0;
            pairCount = pairCount + 1;
            choosingArray
        end
    else
        
        %If the two uncovered values are not equal then the player will be
        %notified of that and the game will continue.
        
        fprintf('\n Not a match! Keep trying! \n')
        choosingArray
    end
end

%These will mark the end of the game. The fprintf statement will show up,
%and the time it took for the player to end the game will also be with the
%statement.

toc;
fprintf('\n Congratulations you have won! It took you %0.2f seconds, can you do better???? Let''s see :) \n', toc)
