local raids = {
	[1] = 'Orhsabaal',
	[2] = 'Morgaroth',
	[3] = 'Ghazbaran',
	[4] = 'Ferumbras',
	[5] = 'Mawhawk',
	[6] = 'Orc Backpack',
	[7] = 'Citizen',
	[8] = 'Draptor',
	[9] = 'Necropharus',
	[10] = 'Yeti'
}

local spawnRaids = GlobalEvent("spawn raids")
function spawnRaids.onThink(interval, lastExecution, thinkInterval)
	selectedRaid = raids[math.random(1, 10)];

	if selectedRaid then
		Game.startRaid(selectedRaid)
	end

	return true
end

spawnRaids:interval(3600000)
spawnRaids:register()
