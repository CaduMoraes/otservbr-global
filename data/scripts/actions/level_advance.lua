local mainVocations = {
	VOCATION.CLIENT_ID.KNIGHT,
	VOCATION.CLIENT_ID.PALADIN,
	VOCATION.CLIENT_ID.SORCERER,
	VOCATION.CLIENT_ID.DRUID
} 

local rewardsConfig = {
	-- money
	{
		level = 20,
		vocations = mainVocations,
		storage = 25100,
		items = {
			{ 2160, 2 },
		}
	}
}

local reward = CreatureEvent("RewardLevel")

function reward.onAdvance(player, skill, oldLevel, newLevel)
	if skill ~= SKILL_LEVEL then
		return true
	end
	
	for i1, rewardConfig in pairs(rewardsConfig) do
		if newLevel >= rewardConfig.level then
			if table.contains(rewardConfig.vocations, player:getVocation():getClientId()) then
				if player:getStorageValue(rewardConfig.storage) < 1 then
					player:setStorageValue(rewardConfig.storage, os.time())
					for i2, item in pairs(rewardConfig.items) do
						player:addItem(item[1], item[2])
					end
					player:getPosition():sendMagicEffect(CONST_ME_CRAPS)
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received reward for getting " .. rewardConfig.level .. " level.")
				end
			end
		end
	end
	
	return true
end

reward:register()
