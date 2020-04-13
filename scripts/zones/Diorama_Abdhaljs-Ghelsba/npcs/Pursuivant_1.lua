-----------------------------------
-- Area: Diorama Abdhaljs-Ghelsba
--  NPC: Pursuivant
-- !pos -207.470 -10.332 250.136 43
-----------------------------------
local ID = require("scripts/zones/Diorama_Abdhaljs-Ghelsba/IDs")
require("scripts/globals/ballista")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local gamePhase = tpz.ballista.getZoneGameState(player:getZoneID())
    player:startEvent(12, 1, 1, gamePhase)
end

function onEventUpdate(player, csid, option)
    if csid == 12 and option == 0 then
        player:updateEvent(1)
    end
end

function onEventFinish(player, csid, option)
    if csid == 12 and option == 2 then
        player:setPos(36, 0, -7, 0, 243)
    end
end
