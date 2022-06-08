% Calculate how much extra growth there is from partially grown sugarcane

% yieldFromPartial: how much extra growth is given by partially grown sugarcane

% chances: probability distribution that the sugarcane recieves random ticks
% partials: probability distribution of sugarcane being at different growth stages

function yieldFromPartial = calculatePartialContribution(chances, partials)
    oneGrowth = 0;
    twoGrowth = 0;

    % relevant growth ammounts where partial growth would affect yield
    for numGrowths = 0:29
        % possible partial growth stages
        for i = 0:14

            % check if current case grows twice
            if (numGrowths + i) >= 30
                numExtra = chances(numGrowths+1) * partials(i+1);
                twoGrowth = twoGrowth + numExtra;

            %check if current case grows once
            elseif (numGrowths + i) >= 15
                numExtra = chances(numGrowths+1) * partials(i+1);
                oneGrowth = oneGrowth + numExtra;
            end
    
        end
    end

    % add together both for total yield
    % (thought I'd do something to visualize double vs single growth, but didn't)
    yieldFromPartial = oneGrowth + (2 * twoGrowth);

end