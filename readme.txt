A matlab script for optimizing sugarcane harvesting in minecraft:

This project calculates probability distributions for sugarcane growth in minecraft which is uses to predict steady state yield when harvested at different periods.
The top level function is "plotSugarCaneYieldDistribution" (all other functions are helper functions). 

Included is data from running the script from 1 tick to 70000 ticks at every tick interval.

Findings:
Maximum yield of 4.883E-05 yield per sugarcane per tick when harvesting every game tick.
Local "low lag" maximum of 3.827E-05 when harvesting every 46040 ticks (38.4 minutes). 78% of maximum
Local minimum of 3.444E-05 when harvesting every 32858 ticks (27.4 minutes). 70% of maximum

Notable points:
Harvesting every ~7 minutes gives >99% the yield of harvesting every game tick.
Equivalent yield to "low lag" peak when harvesting every ~20.8 minutes

For the non-technical
1 game tick = 1/20 a second
Mulitply yield values by 72000 to get how much sugarcane you can expect per hour from each sugarcane planted.
