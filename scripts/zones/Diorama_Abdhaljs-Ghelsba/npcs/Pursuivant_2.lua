-----------------------------------
-- Area: Diorama Abdhaljs-Ghelsba
--  NPC: Pursuivant
-- !pos -155.861 -10.000 66.829 43
-----------------------------------
local ID = require("scripts/zones/Diorama_Abdhaljs-Ghelsba/IDs")
require("scripts/globals/ballista")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local gamePhase = tpz.ballista.getZoneGameState(player:getZoneID())
    player:startEvent(13, 1, 0, gamePhase)
end

function onEventUpdate(player, csid, option)
    if csid == 13 and option == 0 then
        player:updateEvent(1)
    end
end

function onEventFinish(player, csid, option)
    if csid == 13 and option == 1 then
        player:setPos(-200, -10, 252, 131, 43)
    elseif csid == 13 and option == 2 then
        player:setPos(36, 0, -7, 0, 243)
    end
end
