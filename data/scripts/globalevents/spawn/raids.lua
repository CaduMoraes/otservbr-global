local raids = {
	[1] = 'Orhsabaal',
	[2] = 'Morgaroth',
	[3] = 'Ghazbaran',
	[4] = 'Ferumbras',
	[5] = 'Mawhawk',
	[6] = 'Orc Backpack',
	[7] = 'Horadron',
	[8] = 'Draptor',
	[9] = 'Necropharus',
	[10] = 'Yeti'
}

local horadronTest = true;
local spawnRaids = GlobalEvent("spawn raids")
function spawnRaids.onThink(interval, lastExecution, thinkInterval)
	selectedRaid = raids[math.random(1, 10)];

	if (horadronTest) then
		selectedRaid = raids[7];
		horadronTest = false;
	end
	if selectedRaid then
		Game.startRaid(selectedRaid)
	end

	return true
end

spawnRaids:interval(3600000)
spawnRaids:register()
