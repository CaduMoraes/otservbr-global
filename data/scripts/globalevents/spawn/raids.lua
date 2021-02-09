local raids = {
	['Monday'] = { 						-- Day of the week
		{
			name = 'Morgaroth', 		-- Name of the raid (according to raids.xml)
			already_executed = false, 	-- Boolean that indicates if the raid already happened. To prevent duplicate raids
			raid_hour = '22', 			-- The hour when the raid will spawn
			chance = 7,					-- Percentage of chance for the raid to happen
		},
	},
	['Tuesday'] = {
		{
			name = 'Apocalypse',
			already_executed = false,
			raid_hour = '22',
			chance = 6,
		},
	},
	['Wednesday'] = {
		{
			name = 'Jaul',
			already_executed = false,
			raid_hour = '19',
			chance = 100,
		},
		{
			name = 'Obujos',
			already_executed = false,
			raid_hour = '19',
			chance = 100,
		},
		{
			name = 'Tanjis',
			already_executed = false,
			raid_hour = '19',
			chance = 100,
		},
		{
			name = 'Orhsabaal',
			already_executed = false,
			raid_hour = '22',
			chance = 8,
		},
		{
			name = 'King Zelos',
			already_executed = false,
			raid_hour = '22',
			chance = 4,
		},
	},
	['Thursday'] = {
		{
			name = 'Ferumbras',
			already_executed = false,
			raid_hour = '22',
			chance = 3,
		},
	},
	['Friday'] = {
		{
			name = 'Verminor',
			already_executed = false,
			raid_hour = '22',
			chance = 4,
		},
		{
			name = 'Ghazbaran',
			already_executed = false,
			raid_hour = '22',
			chance = 5,
		},
	},
	['Saturday'] = {
		{
			name = 'Infernatil',
			already_executed = false,
			raid_hour = '22',
			chance = 4,
		},
	},
	['Sunday'] = {
		{
			name = 'Zoralurk',
			already_executed = false,
			raid_hour = '22',
			chance = 5,
		},
	},
};

-- This function checks the raids table (yes, table, because in Lua associative arrays are called tables)
-- to look for raids to happen. If the current day matches a record on the table and the current hour
-- is higher or equal to the one on the table, the invasion happens. If there is more than one invasion
-- inside the hours key of the table, they will occur every five minutes starting from the first one.

local minutesSinceLastRaid = 0;
local spawnRaids = GlobalEvent("spawn raids");
function spawnRaids.onThink(interval, lastExecution, thinkInterval)
	local day, hour = os.date('%A'), os.date('%H');

	if raids[day] then
		for i = 1, #raids[day] do
			if not raids[day][i].already_executed and minutesSinceLastRaid >= 5 and raids[day][i].raid_hour <= hour then
				local randomNumber = math.random(100);
				print(randomNumber);								-- This a test to see if the same number will be generated over and over.
				if raids[day][i].chance >= randomNumber then
					minutesSinceLastRaid = 0;
					Game.startRaid(raids[day][i].name)
				end
				raids[day][i].already_executed = true;				-- Spite some of the raids not being executed due to RNG. We mark them as executed
			end														-- because they have only one attempt to spawn.
		end
	end

	minutesSinceLastRaid = minutesSinceLastRaid + 1;

	return true
end

spawnRaids:interval(60000)
spawnRaids:register()
