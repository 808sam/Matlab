% Get's chance of a block being chosen for a random tick

% tickChance: chance of being the chosen one
function tickChance = getTickChance()
    % 16x16x16 blocks per subchunk -> each random tick has 1/4096 of
    % selecting a given block
    tickChance = 1/ 4096; % is there a more elegant way to define constants in matlab?
end