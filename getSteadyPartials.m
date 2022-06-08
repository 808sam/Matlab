% Calculate steady state distribution of partially grown sugarcane

% partials: distribution of sugarcane at different growth stages

% ticksPerHarveest: how long is between each harvest period
% tickSpeed: number of random ticks per game tick (game defaults to 3)

function partials = getSteadyPartials(ticksPerHarvest, tickSpeed)
    numTries = ticksPerHarvest*tickSpeed;
    chanceOfGrowths = binopdf(0:14, numTries, getTickChance());

    %array for system of equations
    A = zeros(15, 16);


    % System of equations logic

    % Y_n = number of partial growths
    % C_n = chance of number of growths
    % x = current number of partial growth equation is for

    % find all combinations of partial growth + new growth that result 
    % in a given number of partials
    
    % Y_0*C_x + Y_1*C_(x-1)%15 + ... + Y_14*C_(x-14)%15 = Y_x
    % ('%' is positive modulo function)
    
    % x = 0 equation would require guarenteed growths (above 15). This
    % would often round to 0 causing errors.
    % Replace this with alternative equation specifiying that total
    % distribution must add to 1.


    % Everything added together should equal 1
    A(1,:) = ones(1,16);

    % xth equation
    for x = 1:14
        %nth term in equation
        for n = 0:14
            % get coefficient of term
            A(x+1, n+1) = chanceOfGrowths(mod(x-n+15,15)+1);    % why does matlab start arrays at 1?!

            % move right side of equation over (coefficient just gets -1)
            if (n == x)
                A(x+1, n+1) = A(x+1, n+1) - 1;
            end
        end
        % right side of equation should be zero for all (except x = 0)
        A(x+1, 16) = 0;
    end

    % solve system of equations
    A = rref(A);    % yay linear algebra!

    % answers should be in last collumn
    partials = A(:, 16)';
end