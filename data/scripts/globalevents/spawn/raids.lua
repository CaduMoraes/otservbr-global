local timedRaids = {
	['Wednesday'] = {
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
	};
};

local minutesSinceLastRaid = 0;
local spawnRaids = GlobalEvent("spawn raids")
function spawnRaids.onThink(interval, lastExecution, thinkInterval)
	local day = os.date('%A')

	if timedRaids[day] then
		for i = 1, #timedRaids[day] do
			if not timedRaids[day][i].execute_time and minutesSinceLastRaid >= 5 then
				minutesSinceLastRaid = 0;
				Game.startRaid(timedRaids[day][i].name)
				timedRaids[day][i].execute_time = os.time();
			end
		end
	end

	minutesSinceLastRaid = minutesSinceLastRaid + 1;

	return true
end

spawnRaids:interval(60000)
spawnRaids:register()
