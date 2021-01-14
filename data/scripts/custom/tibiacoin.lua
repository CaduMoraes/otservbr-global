local coins = Action() 

function coins.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local coins = 1
      db.query("UPDATE `accounts` SET `coins` = `coins` + '" .. coins .. "' WHERE `id` = '" .. player:getAccountId() .. "';")
      player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received "..coins.." store coin(s)")
      item:remove(1)
      return true
end

coins:id(24774)
coins:register()