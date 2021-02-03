local timedRaids = {
	['Wednesday'] = {			-- Day of the week
		['19'] = {				-- Hour
			{
				name = 'Jaul',
				execute_time = nil,
			},
			{
				name = 'Obujos',
				execute_time = nil,
			},
			{
				name = 'Tanjis',
				execute_time = nil,
			},
		}
	};
};

-- This function checks the timedRaids table (yes, table, because in Lua associative arrays are called tables)
-- to look for raids to happen. If the current day matches a record on the table and the current hour
-- is higher or equal to the one on the table, the invasion happens. If there is more than one invasion
-- inside the hours key of the table, they will occur every five minutes starting from the first one.

local minutesSinceLastRaid = 0;
local spawnRaids = GlobalEvent("spawn raids")
function spawnRaids.onThink(interval, lastExecution, thinkInterval)
	local day, hour = os.date('%A'), os.date('%H');

	if timedRaids[day] then
		local i = 1;
		for k,v in pairs(timedRaids[day]) do
			if not k[i].execute_time and minutesSinceLastRaid >= 5 and k <= hour then
				minutesSinceLastRaid = 0;
				Game.startRaid(k[i].name)
				k[i].execute_time = os.time();
			end
			i = i + 1;
		end
	end

	minutesSinceLastRaid = minutesSinceLastRaid + 1;

	return true
end

spawnRaids:interval(60000)
spawnRaids:register()
