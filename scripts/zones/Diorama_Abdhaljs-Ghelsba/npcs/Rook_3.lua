-----------------------------------
-- Area: Diorama Abdhaljs-Ghelsba
--  NPC: Rook
-- !pos -40.000 -0.600 40.100 43
-----------------------------------
local ID = require("scripts/zones/Diorama_Abdhaljs-Ghelsba/IDs")
require("scripts/globals/ballista")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    tpz.ballista.onRookTrigger(player, npc)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
