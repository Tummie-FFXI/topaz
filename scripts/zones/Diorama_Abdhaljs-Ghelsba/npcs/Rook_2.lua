-----------------------------------
-- Area: Diorama Abdhaljs-Ghelsba
--  NPC: Rook
-- !pos -176.323 -10.571 124.307 43
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
