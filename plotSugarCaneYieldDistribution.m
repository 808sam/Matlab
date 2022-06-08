% calculates and plots expected yield of sugarcane vs harvest period

% yieldDistribution: Ticks per harvest vs Yeild/Tick for a sugarCane
% ticksPlotted: x-axis of plot

% minTicks: minimum harvest period in ticks to plot
% maxTicks: maximum harvest peiod in ticks to plot
% tickSpeed: random tick speed of game (game defaults to 3)
% numberOfPoints: how many points to plot

function [yieldDistribution, ticksPlotted] = plotSugarCaneYieldDistribution(minTicks, maxTicks, tickSpeed, numberOfPoints)

    %get which ticks to try
    ticksPlotted = round(linspace(minTicks, maxTicks, numberOfPoints));

    %init yieldDistribution
    yieldDistribution = zeros(1, length(ticksPlotted));

    %init plot
    figure;
    p = plot(ticksPlotted, yieldDistribution);
    xlabel('Ticks / Harvest');
    ylabel('Yield / (Crop * Tick)');
    title('Sugarcane Harvest');

    %try each harvest period
    for i = 1:length(ticksPlotted)
        % probability of at least 2 growths
        guarenteedGrowths = 1 - binocdf(29, ticksPlotted(i) * tickSpeed, getTickChance());

        % extra growth from partially grown sugarcane
        partials = getSteadyPartials(ticksPlotted(i), tickSpeed);
        growthDistribution = getMultipleTickDistribution(ticksPlotted(i), tickSpeed, 30);
        partialsContribution = calculatePartialContribution(growthDistribution, partials);

        % Total yield for harvest period per tick
        yieldDistribution(i) = (partialsContribution + 2*guarenteedGrowths)/(ticksPlotted(i));

        %update plot
        p.YData = yieldDistribution;
        refreshdata(p);
        drawnow;
    end
end