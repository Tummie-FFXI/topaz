-----------------------------------
-- Area: Ru'Lude Gardens
--   NPC: Tillecoe
-- Type: Standard NPC
-- !pos 38.528 -0.997 -6.363 243
-----------------------------------
require("scripts/globals/ballista")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
    local license = player:hasKeyItem(tpz.ki.BALLISTA_LICENSE)
    if
        (npcUtil.tradeHas(trade, 5302) or npcUtil.tradeHas(trade, 5303)) and
        license and
        player:getGil() >= tpz.ballista.entryFee
    then
        player:startEvent(144, tpz.ballista.entryFee)
    else
        player:startEvent(72) -- Not valid
    end
end

function onTrigger(player,npc)
    local license = player:hasKeyItem(tpz.ki.BALLISTA_LICENSE)
    local onList = false

    --[[
    if not license then
        player:startEvent(73)
    elseif onList then
        player:startEvent(71)
    else
        player:startEvent(70)
    end
    player:addItem(5302)
    ]]--

    player:startEvent(144, tpz.ballista.entryFee)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 144 and option == 1 then
        player:confirmTrade()
        player:delGil(tpz.ballista.entryFee)
        player:setPos(-200, -10, 252, 131, 43)
    elseif csid == 70 then
    end
end