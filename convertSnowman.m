rgb = imread('unicodesnowman.png');
bw = rgb2gray(rgb);

% bwe -> matrix of pixels, 1's represent edges (lines to be drawn)
bwe = edge(bw,'Canny');

[rows, cols] = size(bwe);

count = 0;
currentRow = 1;
currentCol = 1;
targetRow = 1;
targetCol = 1;

% pre-allocate for efficiency
out = zeros(cols*rows, 3);

%out(:,1);% v1
%out(:,2);% v2
%out(:,3);% pen


while 1
    if currentRow > rows || currentCol > cols
        break
    end
    
    % if current pixels is 1    
    if bwe(currentRow, currentCol) == 1
        % set current pixel as target, add pwm values to out
        count = count + 1;
        targetRow = currentRow;
        targetCol = currentCol;
        [theta1, theta2] = xyToLinkageAngles(targetRow, targetCol);
        [v1,v2] = a2pwm(theta1,theta2);
        out(count,1) = v1;
        out(count,2) = v2;
        out(count,3) = 1500;
        
        % remove pixel from image        
        bwe(currentRow, currentCol) = 0;
        
        % if target pixel has any 1s around it, set that to current pixel
        % next iteration will go directly to that surrounding pixel
        if bwe(targetRow - 1, targetCol - 1) == 1
            currentRow = targetRow - 1;
            currentCol = targetCol - 1;
        elseif bwe(targetRow -1, targetCol) == 1
            currentRow = targetRow - 1;
            currentCol = targetCol;
        elseif bwe(targetRow -1, targetCol + 1) ==1
            currentRow = targetRow - 1;
            currentCol = targetCol + 1;
        elseif bwe(targetRow, targetCol - 1) == 1
            currentRow = targetRow;
            currentCol = targetCol - 1;
        elseif bwe(targetRow, targetCol + 1) == 1
            currentRow = targetRow;
            currentCol = targetCol + 1;
        elseif bwe(targetRow + 1, targetCol - 1) == 1
            currentRow = targetRow + 1;
            currentCol = targetCol - 1;
        elseif bwe(targetRow + 1, targetCol) == 1
            currentRow = targetRow + 1;
            currentCol = targetCol;
        elseif bwe(targetRow + 1, targetCol + 1) == 1
            currentRow = targetRow + 1;
            currentCol = targetCol + 1;
        else
            % lift pen
            count = count + 1;
            out(count,1) = out(count-1,1);
            out(count,2) = out(count-1,2);
            out(count,3) = 1200;
            %return to start of image
            currentRow = 1;
            currentCol = 1;
        end
        
    else
        if currentCol < cols
            currentCol = currentCol + 1;
        else
            currentCol = 1;
            currentRow = currentRow + 1;
        end
    end
    
    
    
end

% remove rows with all zeros
out = out(any(out,2),:);

dlmwrite('snowman', out);