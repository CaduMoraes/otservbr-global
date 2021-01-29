local raids = {
	[1] = 'Orhsabaal',
	[2] = 'Morgaroth',
	[3] = 'Ghazbaran',
	[5] = 'Mawhawk',
	[6] = 'Orc Backpack',
	[7] = 'Draptor',
	[8] = 'Necropharus',
	[9] = 'Yeti'
}

local horadronTest = true;
local spawnRaids = GlobalEvent("spawn raids")
function spawnRaids.onThink(interval, lastExecution, thinkInterval)
	selectedRaid = raids[math.random(1, 10)];
	if selectedRaid then
		Game.startRaid(selectedRaid)
	end

	return true
end

spawnRaids:interval(1800000000)
spawnRaids:register()
