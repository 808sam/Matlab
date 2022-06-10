% Calculate probability distribution of a crop recieving mulitple random ticks

% distribution: chance of getting 0 to maxCare random ticks in a given period

% ticks: how long a period covered
% tickSpeed: how many random ticks per game tick (game defaults to 3)
% maxCare: highest number of random ticks probability to calculate

function distribution = getMultipleTickDistribution(ticks, tickSpeed, maxCare)

    % init values
    numTries = ticks*tickSpeed;
    tickChance = getTickChance();

    % get chances of each number of random ticks for all the different wait
    % times
    distribution = binopdf(0:maxCare, numTries, tickChance);
end