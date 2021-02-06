 local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = {
	{ text = '' },
}

npcHandler:addModule(VoiceModule:new(voices))

-- Storage IDs -- 
hunter = 89050     
mage_male = 89051
knight = 89052    
nobleman = 89053     
summoner_female = 89054
warrior = 89055     
barbarian = 89056     
druid = 89057 
wizard = 89058     
oriental = 89059     
pirate = 89060     
assassin = 89061     
beggar = 89062    
shaman = 89063     
norseman = 89064     
nightmare = 89065 
jester = 89066   
brotherhood = 89067    
elementalist = 89068
deepling = 89069
insectoid = 89070
citzen = 89071
festive = 89072
golden = 89073
mage_female = 89075
summoner_male = 89076

already = 'It seems you already have this addon, don\'t you try to mock me son!'
newaddon = 'Here you are, enjoy your brand new addon!'
noitems = 'You do not have all the required items.'
nomoney = 'You do not have the required money.'
     

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
	local player = Player(cid)
	
	
	-- hunter
	if msgcontains(msg, "hunter") then
		if player:getStorageValue(hunter) == 1 then
			npcHandler:say(already, cid)
			return true
		end
			npcHandler:say("To achieve the full hunter addon you need to give me {1 elane's crossbow, 1 sniper gloves, 100 lizard leathers, 100 red dragon leathers, 5 enchanted chicken wings, 1 piece of royal steel, 1 piece of draconian steel and 1 piece of hell stell}. Do you have them with you?", cid)
			npcHandler.topic[cid] = 1
		elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 1 then
			if player:getItemCount(5875) >= 1 and
				player:getItemCount(5947) >= 1 and
				player:getItemCount(5889) >= 1 and
				player:getItemCount(5887) >= 1 and 
				player:getItemCount(5888) >= 1 and  
				player:getItemCount(5891) >= 5 and  
				player:getItemCount(5948) >= 100 and 
				player:getItemCount(5876) >= 100 
				then			
				player:removeItem(5875, 1)
				player:removeItem(5947, 1)
				player:removeItem(5889, 1)
				player:removeItem(5887, 1)
				player:removeItem(5888, 1)
				player:removeItem(5891, 5)
				player:removeItem(5948, 100)
				player:removeItem(5876, 100)
				player:getPosition():sendMagicEffect(171)
				player:addOutfitAddon(129, 3)
				player:addOutfitAddon(137, 3)
				player:setStorageValue(hunter, 1)
				npcHandler:say(newaddon, cid)
			else
				npcHandler:say(noitems, cid)
			end
				npcHandler.topic[cid] = 0
		end
	-- hunter end
	-- mage
	
	if player:getSex() == 0 then
			if msgcontains(msg, "mage") then
				if player:getStorageValue(mage_female) == 1 then
						npcHandler:say(already, cid)
					return true
				end	
				npcHandler:say("To achieve the full mage addon you need to give me {1 winning lottery ticket, 70 bat wings, 20 red piece of cloth, 100 spider silks, 60 lizard scales, 40 red dragon leather, 15 magic sulphur and 30 vampire dust}. Do you have them with you?", cid)
				npcHandler.topic[cid] = 2
			elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 2 then
				if player:getItemCount(5958) >= 1 and 
					player:getItemCount(5894) >= 70 and
					player:getItemCount(5911) >= 20 and
					player:getItemCount(5879) >= 100 and
					player:getItemCount(5881) >= 60 and
					player:getItemCount(5948) >= 40 and
					player:getItemCount(5904) >= 15 and
					player:getItemCount(5905) >= 30
					then			
					player:removeItem(5958, 1)
					player:removeItem(5894, 70)
					player:removeItem(5911, 20)
					player:removeItem(5879, 100)
					player:removeItem(5881, 60)
					player:removeItem(5948, 40)
					player:removeItem(5904, 15)
					player:removeItem(5905, 30)
					player:getPosition():sendMagicEffect(171)
					player:addOutfitAddon(138, 3)
					player:setStorageValue(mage_female, 1)
					npcHandler:say(newaddon, cid)
				else
					npcHandler:say(noitems, cid)
				end
				npcHandler.topic[cid] = 0
			end
	end
	if player:getSex() == 1 then
			if msgcontains(msg, "mage") then
				if player:getStorageValue(mage_female) == 1 then
						npcHandler:say(already, cid)
					return true
				end	
					npcHandler:say("To achieve the full mage addon you need to give me {a Ferumbras' hat, 10 magic sulphurs, 20 ankhs and 1 soul stone}. Do you have them with you?", cid)
					npcHandler.topic[cid] = 3
				elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 3 then
						if player:getItemCount(5903) >= 1 and 
							player:getItemCount(5809) >= 1 and
							player:getItemCount(2193) >= 20 and
							player:getItemCount(5904) >= 10
						then			
							player:removeItem(5903, 1)
							player:removeItem(5809, 1)
							player:removeItem(2193, 20)
							player:removeItem(5904, 10)
							player:getPosition():sendMagicEffect(171)
							player:addOutfitAddon(130, 3)
							player:setStorageValue(mage_male, 1)
							npcHandler:say(newaddon, cid)
					else
						npcHandler:say(noitems, cid)
					end
					npcHandler.topic[cid] = 0
				end
	end
	-- mage end
	-- knight
		if msgcontains(msg, "knight") then
		if player:getStorageValue(knight) == 1 then
						npcHandler:say(already, cid)
					return true
				end	
			npcHandler:say("To achieve the full knight addon you need to give me {100 iron ore, 100 perfect behemoth fangs, 1 flask of warrior's sweat, 1 piece of of royal steel and 1 huge chunk of crude iron}. Do you have them with you?", cid)
			npcHandler.topic[cid] = 4
		elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 4 then
			if player:getItemCount(5880) >= 100 and 
				player:getItemCount(5892) >= 1 and
				player:getItemCount(5887) >= 1 and 
				player:getItemCount(5885) >= 1 and  
				player:getItemCount(5893) >= 100
				then			
				player:removeItem(5880, 100)
				player:removeItem(5892, 1)
				player:removeItem(5887, 1)
				player:removeItem(5885, 1)
				player:removeItem(5893, 100)
				player:getPosition():sendMagicEffect(171)
				player:addOutfitAddon(139, 3)
				player:addOutfitAddon(131, 3)
				player:setStorageValue(knight, 1)
				npcHandler:say(newaddon, cid)
			else
				npcHandler:say(noitems, cid)
			end
			npcHandler.topic[cid] = 0
		end
	
	
	--knight end
	--nobleman
		if msgcontains(msg, "nobleman") then
			if player:getStorageValue(nobleman) == 1 then
						npcHandler:say(already, cid)
					return true
				end	
			npcHandler:say("To achieve the full nobleman addon you need to give me {300k}. Do you have them with you?", cid)
			npcHandler.topic[cid] = 5
		elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 5 then
			if player:getMoney() + player:getBankBalance() >= 300000
				then			
				player:removeMoneyNpc(300000)
				player:getPosition():sendMagicEffect(171)
				player:addOutfitAddon(132, 3)
				player:addOutfitAddon(140, 3)
				player:setStorageValue(nobleman, 1)
				npcHandler:say(newaddon, cid)
			else
				npcHandler:say(nomoney, cid)
			end
			npcHandler.topic[cid] = 0
		end
	-- nobleman end
	-- summoner
	if player:getSex() == 1 then
			if msgcontains(msg, "summoner") then
				if player:getStorageValue(summoner_male) == 1 then
						npcHandler:say(already, cid)
					return true
				end	
				npcHandler:say("To achieve the full summoner addon you need to give me {1 winning lottery ticket, 20 red piece of cloth, 40 ape fur, 35 holy orchids, 100 spider silks, 60 lizard scales, 40 red dragon leather, 15 magic sulphur and 30 vampire dust}. Do you have them with you?", cid)
				npcHandler.topic[cid] = 6
			elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 6 then
				if player:getItemCount(5958) >= 1 and 
					player:getItemCount(5894) >= 70 and
					player:getItemCount(5883) >= 40 and
					player:getItemCount(5922) >= 35 and
					player:getItemCount(5911) >= 20 and
					player:getItemCount(5879) >= 100 and
					player:getItemCount(5881) >= 60 and
					player:getItemCount(5948) >= 40 and
					player:getItemCount(5904) >= 15 and
					player:getItemCount(5905) >= 30
					then			
					player:removeItem(5958, 1)
					player:removeItem(5894, 70)
					player:removeItem(5911, 20)
					player:removeItem(5879, 100)
					player:removeItem(5881, 60)
					player:removeItem(5948, 40)
					player:removeItem(5904, 15)
					player:removeItem(5905, 30)
					player:getPosition():sendMagicEffect(171)
					player:addOutfitAddon(133, 3)
					player:setStorageValue(summoner_male, 1)
					npcHandler:say(newaddon, cid)
				else
					npcHandler:say(noitems, cid)
				end
				npcHandler.topic[cid] = 0
			end
		end
	if player:getSex() == 0 then
			if msgcontains(msg, "summoner") then
				if player:getStorageValue(summoner_female) == 1 then
						npcHandler:say(already, cid)
					return true
				end	
					npcHandler:say("To achieve the full summoner addon you need to give me {a Ferumbras' hat, 10 magic sulphurs, 20 ankhs and 1 soul stone}. Do you have them with you?", cid)
					npcHandler.topic[cid] = 7
				elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 7 then
						if player:getItemCount(5903) >= 1 and 
							player:getItemCount(5809) >= 1 and
							player:getItemCount(2193) >= 20 and
							player:getItemCount(5904) >= 10
						then			
							player:removeItem(5903, 1)
							player:removeItem(5809, 1)
							player:removeItem(2193, 20)
							player:removeItem(5904, 10)
							player:getPosition():sendMagicEffect(171)
							player:addOutfitAddon(141, 3)
							player:setStorageValue(summoner_female, 1)
							npcHandler:say(newaddon, cid)
					else
						npcHandler:say(noitems, cid)
					end
					npcHandler.topic[cid] = 0
				end
				
	end
	
	--summoner end
	--warrior
		if msgcontains(msg, "warrior") then
		if player:getStorageValue(warrior) == 1 then
						npcHandler:say(already, cid)
					return true
				end	
			npcHandler:say("To achieve the full warrior addon you need to give me {a dragon claw, spirit container, 100 iron ore, 100 turtle shells, 100 hardened bone and 1 piece of royal steel}. Do you have them with you?", cid)
			npcHandler.topic[cid] = 8
		elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 8 then
			if player:getItemCount(5880) >= 100 and 
				player:getItemCount(5899) >= 100 and
				player:getItemCount(5925) >= 100 and
				player:getItemCount(5887) >= 1 and 
				player:getItemCount(5919) >= 1 and  
				player:getItemCount(5884) >= 1
				then
				player:removeItem(5880, 100)
				player:removeItem(5899, 100)
				player:removeItem(5925, 100)
				player:removeItem(5887, 1)
				player:removeItem(5919, 1)
				player:removeItem(5884, 1)
				player:getPosition():sendMagicEffect(171)
				player:addOutfitAddon(134, 3)
				player:addOutfitAddon(142, 3)
				player:setStorageValue(warrior, 1)
				npcHandler:say(newaddon, cid)
			else
				npcHandler:say(noitems, cid)
			end
			npcHandler.topic[cid] = 0
		end
	--warrior end
	-- barbarian
		if msgcontains(msg, "barbarian") then
			if player:getStorageValue(barbarian) == 1 then
						npcHandler:say(already, cid)
					return true
				end	
			npcHandler:say("To achieve the full barbarian addon you need to give me {100 iron ore, 50 perfect behemoth fang, 50 lizard leather, 50 pieces of red cloth, 50 pieces of green cloth, 100 spider silks, 1 flask of warrior sweat, 1 spirit container and 1 huge chunk of crude iron}. Do you have them with you?", cid)
			npcHandler.topic[cid] = 9
		elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 9 then
			if player:getItemCount(5880) >= 100 and 
				player:getItemCount(5892) >= 1 and
				player:getItemCount(5893) >= 50 and 
				player:getItemCount(5876) >= 50 and  
				player:getItemCount(5884) >= 1 and
				player:getItemCount(5911) >= 50 and
				player:getItemCount(5910) >= 50 and
				player:getItemCount(5879) >= 100 and
				player:getItemCount(5885) >= 1
				then
				player:removeItem(5880, 100)
				player:removeItem(5892, 1)
				player:removeItem(5893, 50)
				player:removeItem(5876, 50)
				player:removeItem(5884, 1)
				player:removeItem(5911, 50)
				player:removeItem(5910, 50)
				player:removeItem(5879, 100)
				player:removeItem(5885, 1)
				player:getPosition():sendMagicEffect(171)
				player:addOutfitAddon(143, 3)
				player:addOutfitAddon(147, 3)
				player:setStorageValue(barbarian, 1)
				npcHandler:say(newaddon, cid)
			else
				npcHandler:say(noitems, cid)
			end
			npcHandler.topic[cid] = 0
		end
	--barbarian end
	--druid
		if msgcontains(msg, "druid") then
		if player:getStorageValue(druid) == 1 then
						npcHandler:say(already, cid)
					return true
				end	
			npcHandler:say("To achieve the full druid addon you need to give me {50 bear paws, 50 wolf paw and 100 demon dust}. Do you have them with you?", cid)
			npcHandler.topic[cid] = 10
		elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 10 then
			if player:getItemCount(5906) >= 100 and 
				player:getItemCount(5897) >= 50 and
				player:getItemCount(5896) >= 50
				then
				player:removeItem(5906, 100)
				player:removeItem(5897, 50)
				player:removeItem(5896, 50)
				player:getPosition():sendMagicEffect(171)
				player:addOutfitAddon(148, 3)
				player:addOutfitAddon(144, 3)
				player:setStorageValue(druid, 1)
				npcHandler:say(newaddon, cid)
			else
				npcHandler:say(noitems, cid)
			end
			npcHandler.topic[cid] = 0
		end
	--druid end
	-- wizard
		if msgcontains(msg, "wizard") then
		if player:getStorageValue(wizard) == 1 then
						npcHandler:say(already, cid)
					return true
				end	
			npcHandler:say("To achieve the full wizard addon you need to give me {a dragon scale mail, medusa shield, crown legs, ring of the sky and 50 holy orchids}. Do you have them with you?", cid)
			npcHandler.topic[cid] = 11
		elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 11 then
			if player:getItemCount(5922) >= 50 and 
				player:getItemCount(2492) >= 1 and
				player:getItemCount(2123) >= 1 and
				player:getItemCount(2488) >= 1 and
				player:getItemCount(2536) >= 1
				then
				player:removeItem(5922, 50)
				player:removeItem(2492, 1)
				player:removeItem(2123, 1)
				player:removeItem(2488, 1)
				player:removeItem(2536, 1)
				player:getPosition():sendMagicEffect(171)
				player:addOutfitAddon(145, 3)
				player:addOutfitAddon(149, 3)
				player:setStorageValue(wizard, 1)
				npcHandler:say(newaddon, cid)
			else
				npcHandler:say(noitems, cid)
			end
			npcHandler.topic[cid] = 0
		end
	--wizard end
	--oriental
		if msgcontains(msg, "oriental") then
		if player:getStorageValue(oriental) == 1 then
						npcHandler:say(already, cid)
					return true
				end	
			npcHandler:say("To achieve the full oriental addon you need to give me {100 ape fur, 100 fish fins, 1 mermaid comb, 100 pieces of blue cloth and 2 enchanted chicken wings}. Do you have them with you?", cid)
			npcHandler.topic[cid] = 12
		elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 12 then
			if player:getItemCount(5895) >= 100 and 
				player:getItemCount(5945) >= 1 and
				player:getItemCount(5891) >= 2 and
				player:getItemCount(5912) >= 100 and
				player:getItemCount(5883) >= 100
				then
				player:removeItem(5895, 100)
				player:removeItem(5945, 1)
				player:removeItem(5891, 2)
				player:removeItem(5912, 100)
				player:removeItem(5883, 100)
				player:getPosition():sendMagicEffect(171)
				player:addOutfitAddon(150, 3)
				player:addOutfitAddon(146, 3)
				player:setStorageValue(oriental, 1)
				npcHandler:say(newaddon, cid)
			else
				npcHandler:say(noitems, cid)
			end
			npcHandler.topic[cid] = 0
		end
	--oriental end
	--pirate
	if msgcontains(msg, "pirate") then
		if player:getStorageValue(pirate) == 1 then
						npcHandler:say(already, cid)
					return true
				end	
			npcHandler:say("To achieve the full pirate addon you need to give me {Ron the Ripper's Sabre}, {Deadeye Devious' Eye Patch}, {Lethal Lissy's shirt} and {Brutus Bloodbeard's hat}. Do you have them with you?", cid)
			npcHandler.topic[cid] = 13
		elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 13 then
			if player:getItemCount(6100) >= 1 and 
				player:getItemCount(6099) >= 1 and
				player:getItemCount(6102) >= 1 and
				player:getItemCount(6101) >= 1
				then
				player:removeItem(6100, 1)
				player:removeItem(6099, 1)
				player:removeItem(6102, 1)
				player:removeItem(6101, 1)
				player:getPosition():sendMagicEffect(171)
				player:addOutfitAddon(155, 3)
				player:addOutfitAddon(151, 3)
				player:setStorageValue(pirate, 1)
				npcHandler:say(newaddon, cid)
			else
				npcHandler:say(noitems, cid)
			end
			npcHandler.topic[cid] = 0
		end
		--pirate end
		--assassin
		if msgcontains(msg, "assassin") then
		if player:getStorageValue(assassin) == 1 then
						npcHandler:say(already, cid)
					return true
				end	
			npcHandler:say("To achieve the full assassin addon you need to give me {50 pieces of each color of cloth}, {100 spider silk}, {nose ring} and a {behemoth claw}. Do you have them with you?", cid)
			npcHandler.topic[cid] = 14
		elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 14 then
			if player:getItemCount(5909) >= 50 and
				player:getItemCount(5914) >= 50 and
				player:getItemCount(5913) >= 50 and
				player:getItemCount(5911) >= 50 and
				player:getItemCount(5910) >= 50 and
				player:getItemCount(5912) >= 50 and
				player:getItemCount(5879) >= 100 and
				player:getItemCount(5930) >= 1 and
				player:getItemCount(5804) >= 1 
				then
				player:removeItem(5909, 50)
				player:removeItem(5914, 50)
				player:removeItem(5913, 50)
				player:removeItem(5911, 50)
				player:removeItem(5910, 50)
				player:removeItem(5912, 50)
				player:removeItem(5879, 100)
				player:removeItem(5930, 1)
				player:removeItem(5804, 1)
				player:getPosition():sendMagicEffect(171)
				player:addOutfitAddon(156, 3)
				player:addOutfitAddon(152, 3)
				player:setStorageValue(assassin, 1)
				npcHandler:say(newaddon, cid)
			else
				npcHandler:say(noitems, cid)
			end
			npcHandler.topic[cid] = 0
		end
		--assassin end
		--beggar
		if msgcontains(msg, "beggar") then
		if player:getStorageValue(beggar) == 1 then
						npcHandler:say(already, cid)
					return true
				end	
			npcHandler:say("To achieve the full beggar addon you need to give me a {staff}, {10 bat wings}, {30 heaven blossom} and {50 minotaur leather}. Do you have them with you?", cid)
			npcHandler.topic[cid] = 15
		elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 15 then
			if player:getItemCount(5894) >= 10 and
				player:getItemCount(5913) >= 20 and
				player:getItemCount(5921) >= 30 and
				player:getItemCount(5878) >= 50 and				
				player:getItemCount(2401) >= 1
				then
				player:removeItem(5894, 10)
				player:removeItem(5913, 20)
				player:removeItem(5921, 30)
				player:removeItem(5878, 50)				
				player:removeItem(2401, 1)
				player:getPosition():sendMagicEffect(171)
				player:addOutfitAddon(153, 3)
				player:addOutfitAddon(157, 3)
				player:setStorageValue(beggar, 1)
				npcHandler:say(newaddon, cid)
			else
				npcHandler:say(noitems, cid)
			end
			npcHandler.topic[cid] = 0
		end
	-- beggar end
	--shaman
		if msgcontains(msg, "shaman") then
		if player:getStorageValue(shaman) == 1 then
						npcHandler:say(already, cid)
					return true
				end	
			npcHandler:say("To achieve the full shaman addon you need to give me a {5 banana staffs}, {5 tribal masks}, {5 dworc voodoo dolls}, {1 mandrake}. Do you have them with you?", cid)
			npcHandler.topic[cid] = 16
		elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 16 then
			if player:getItemCount(5015) >= 1 and
				player:getItemCount(3966) >= 5 and
				player:getItemCount(3967) >= 5 and
				player:getItemCount(10018) >= 5 
				then
				player:removeItem(5015, 1)
				player:removeItem(3966, 5)
				player:removeItem(3967, 5)
				player:removeItem(10018, 5)
				player:getPosition():sendMagicEffect(171)
				player:addOutfitAddon(154, 3)
				player:addOutfitAddon(158, 3)
				player:setStorageValue(shaman, 1)
				npcHandler:say(newaddon, cid)
			else
				npcHandler:say(noitems, cid)
			end
			npcHandler.topic[cid] = 0
		end
	-- shaman end
	--citizen
		if msgcontains(msg, "citizen") then
		if player:getStorageValue(citizen) == 1 then
						npcHandler:say(already, cid)
					return true
				end	
			npcHandler:say("To achieve the full citizen addon you need to give me a 100 minotaur leathers, 100 chicken feathers, 50 honeycombs, 1 legion helmet. Do you have them with you?", cid)
			npcHandler.topic[cid] = 16
		elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 16 then
			if player:getItemCount(5878) >= 100 and
				player:getItemCount(5890) >= 100 and
				player:getItemCount(5902) >= 50 and
				player:getItemCount(2480) >= 1
				then
				player:removeItem(5878, 100)
				player:removeItem(5890, 100)
				player:removeItem(5902, 50)
				player:removeItem(2480, 1)
				player:getPosition():sendMagicEffect(171)
				player:addOutfitAddon(136, 1)
				player:addOutfitAddon(128, 1)
				player:setStorageValue(citizen, 1)
				npcHandler:say(newaddon, cid)
			else
				npcHandler:say(noitems, cid)
			end
			npcHandler.topic[cid] = 0
		end
	-- citizen end
	--norseman
		if msgcontains(msg, "norseman") then
		if player:getStorageValue(norseman) == 1 then
						npcHandler:say(already, cid)
					return true
				end	
			npcHandler:say("To achieve the full norseman addon you need to give me a {15 shards}. Do you have them with you?", cid)
			npcHandler.topic[cid] = 17
		elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 17 then
			if player:getItemCount(7290) >= 15
				then
				player:removeItem(7290, 15)
				player:getPosition():sendMagicEffect(171)
				player:addOutfitAddon(252, 3)
				player:addOutfitAddon(251, 3)
				player:setStorageValue(norseman, 1)
				npcHandler:say(newaddon, cid)
			else
				npcHandler:say(noitems, cid)
			end
			npcHandler.topic[cid] = 0
		end
	--norseman end
	--nightmare
		if msgcontains(msg, "nightmare") then
		if player:getStorageValue(nightmare) == 1 then
						npcHandler:say(already, cid)
					return true
				end	
			npcHandler:say("To achieve the full nightmare addon you need to give me a {3000 demonic essence}. Do you have them with you?", cid)
			npcHandler.topic[cid] = 18
		elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 18 then
			if player:getItemCount(6500) >= 3000
				then
				player:removeItem(6500, 3000)
				player:getPosition():sendMagicEffect(171)
				player:addOutfitAddon(268, 3)
				player:addOutfitAddon(269, 3)
				player:setStorageValue(nightmare, 1)
				npcHandler:say(newaddon, cid)
			else
				npcHandler:say(noitems, cid)
			end
			npcHandler.topic[cid] = 0
		end
	--nightmare end
	--brotherhood
	if msgcontains(msg, "brotherhood") then
		if player:getStorageValue(brotherhood) == 1 then
						npcHandler:say(already, cid)
					return true
				end	
			npcHandler:say("To achieve the full brotherhood addon you need to give me a {3000 demonic essence}. Do you have them with you?", cid)
			npcHandler.topic[cid] = 19
		elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 19 then
			if player:getItemCount(6500) >= 3000
				then
				player:removeItem(6500, 3000)
				player:getPosition():sendMagicEffect(171)
				player:addOutfitAddon(279, 3)
				player:addOutfitAddon(278, 3)
				player:setStorageValue(brotherhood, 1)
				npcHandler:say(newaddon, cid)
			else
				npcHandler:say(noitems, cid)
			end
			npcHandler.topic[cid] = 0
		end
		--brotherhood end
		--jester
		if msgcontains(msg, "jester") then
		if player:getStorageValue(jester) == 1 then
						npcHandler:say(already, cid)
					return true
				end	
			npcHandler:say("To achieve the full jester addon you need to give me a {10 piece of green, blue, yellow and red cloth}. Do you have them with you?", cid)
			npcHandler.topic[cid] = 20
		elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 20 then
			if player:getItemCount(5910) >= 10 and
			player:getItemCount(5914) >= 10 and
			player:getItemCount(5912) >= 10 and
			player:getItemCount(5911) >= 10 
				then
				player:removeItem(5910, 10)
				player:removeItem(5914, 10)
				player:removeItem(5912, 10)
				player:removeItem(5911, 10)
				player:getPosition():sendMagicEffect(171)
				player:addOutfitAddon(273, 3)
				player:addOutfitAddon(270, 3)
				player:setStorageValue(jester, 1)
				npcHandler:say(newaddon, cid)
			else
				npcHandler:say(noitems, cid)
			end
			npcHandler.topic[cid] = 0
		end
		--jester end
		--elementalist
		if msgcontains(msg, "elementalist") then
		if player:getStorageValue(elementalist) == 1 then
						npcHandler:say(already, cid)
					return true
				end	
			npcHandler:say("To achieve the full elementalist addon you need to give me a {20 slimes moulds, a mage's cap and a elemental spikes}. Do you have them with you?", cid)
			npcHandler.topic[cid] = 21
		elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 21 then
			if player:getItemCount(13758) >= 20 and
			player:getItemCount(13756) >= 1 and
			player:getItemCount(13940) >= 1 
				then
				player:removeItem(13758, 20)
				player:removeItem(13756, 1)
				player:removeItem(13940, 1)
				player:getPosition():sendMagicEffect(171)
				player:addOutfitAddon(433, 3)
				player:addOutfitAddon(432, 3)
				player:setStorageValue(elementalist, 1)
				npcHandler:say(newaddon, cid)
			else
				npcHandler:say(noitems, cid)
			end
			npcHandler.topic[cid] = 0
		end
		--elementalist end
		--deepling
		if msgcontains(msg, "deepling") then
		if player:getStorageValue(deepling) == 1 then
						npcHandler:say(already, cid)
					return true
				end	
			npcHandler:say("To achieve the full deepling addon you need to give me a {jaul's pearl}, {obujos' shell} and {tanjis's sight}. Do you have them with you?", cid)
			npcHandler.topic[cid] = 22
		elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 22 then
			if player:getItemCount(15435) >= 1 and
			player:getItemCount(15436) >= 1 and
			player:getItemCount(15434) >= 1 
				then
				player:removeItem(15435, 1)
				player:removeItem(15436, 1)
				player:removeItem(15434, 1)
				player:getPosition():sendMagicEffect(171)
				player:addOutfitAddon(463, 3)
				player:addOutfitAddon(464, 3)
				player:setStorageValue(deepling, 1)
				npcHandler:say(newaddon, cid)
			else
				npcHandler:say(noitems, cid)
			end
			npcHandler.topic[cid] = 0
		end
		--deepling end
		--insectoid
		if msgcontains(msg, "insectoid") then
		if player:getStorageValue(insectoid) == 1 then
						npcHandler:say(already, cid)
					return true
				end	
			npcHandler:say("To achieve the full insectoid addon you need to give me a {100 crawler head platings}, {100 dung ball}, {100 waspoid wings}, {100 waspoid claws} and {100 compound eyes}. Do you have them with you?", cid)
			npcHandler.topic[cid] = 23
		elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 23 then
			if player:getItemCount(15482) >= 100 and
				player:getItemCount(15622) >= 100 and
				player:getItemCount(15484) >= 100 and
				player:getItemCount(15483) >= 100 and
				player:getItemCount(15486) >= 100
				then
				player:removeItem(15482, 100)
				player:removeItem(15622, 100)
				player:removeItem(15484, 100)
				player:removeItem(15483, 100)
				player:removeItem(15486, 100)
				player:getPosition():sendMagicEffect(171)
				player:addOutfitAddon(466, 3)
				player:addOutfitAddon(465, 3)
				player:setStorageValue(insectoid, 1)
				npcHandler:say(newaddon, cid)
			else
				npcHandler:say(noitems, cid)
			end
			npcHandler.topic[cid] = 0
		end
		--insectoid end
		--festive
		if msgcontains(msg, "festive") then
		if player:getStorageValue(festive) == 1 then
						npcHandler:say(already, cid)
					return true
				end	
			npcHandler:say("To achieve the full festive addon you need to give me a {50 colourful feathers} and {3 porcelain masks}. Do you have them with you?", cid)
			npcHandler.topic[cid] = 24
		elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 24 then
			if player:getItemCount(27756) >= 3 and
				player:getItemCount(27757) >= 50 
				then
				player:removeItem(27756, 3)
				player:removeItem(27757, 50)
				player:getPosition():sendMagicEffect(171)
				player:addOutfitAddon(931, 3)
				player:addOutfitAddon(929, 3)
				player:setStorageValue(festive, 1)
				npcHandler:say(newaddon, cid)
			else
				npcHandler:say(noitems, cid)
			end
			npcHandler.topic[cid] = 0
		end
		--festive end
		--golden
		if msgcontains(msg, "golden") then
		if player:getStorageValue(Storage.OutfitQuest.GoldenOutfit) == 3 then
						npcHandler:say(already, cid)
					return true
				end	
			npcHandler:say("To achieve the full golden addon you need to give me 1.000.000.000 gold pieces. Do you have them with you?", cid)
			npcHandler.topic[cid] = 25
		elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 25 then	
		if player:getMoney() + player:getBankBalance() >= 1000000000 then
					local inbox = player:getSlotItem(CONST_SLOT_STORE_INBOX)
					if inbox and inbox:getEmptySlots() > 0 then
						local decoKit = inbox:addItem(26054, 1)
						local decoItemName = ItemType(36345):getName()
							decoKit:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, "Unwrap it in your own house to create a " .. decoItemName .. ".")
							decoKit:setCustomAttribute("unWrapId", 36345)
							selfSay("Take this armor as a token of great gratitude. Let us forever remember this day, my friend!", cid)
							player:removeMoneyNpc(1000000000)
							player:addOutfitAddon(1211, 3)
							player:addOutfitAddon(1210, 3)
							player:getPosition():sendMagicEffect(171)
							player:setStorageValue(Storage.OutfitQuest.GoldenOutfit, 3)
							npcHandler:say(newaddon, cid)
					else
						selfSay("Please make sure you have free slots in your store inbox.", cid)
					end
				else
				npcHandler:say(nomoney, cid)
			end
			npcHandler.topic[cid] = 0			
		end
		--golden end
	return true
end

keywordHandler:addKeyword({'addons'}, StdModule.say, {npcHandler = npcHandler, text = 'I can offer you full addons of the following outfits: {hunter}, {mage}, {knight}, {nobleman}, {summoner}, {warrior}, {barbarian}, {druid}, {wizard}, {oriental}, {pirate}, {assassin}, {beggar}, {shaman}, {norseman}, {nightmare}, {brotherhood}, {jester}, {elementalist}, {deepling}, {insectoid}, {festive} and the {golden}?'})


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye |PLAYERNAME|.")
npcHandler:addModule(FocusModule:new())