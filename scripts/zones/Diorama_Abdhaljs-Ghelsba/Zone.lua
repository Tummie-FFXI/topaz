-----------------------------------
--
-- Zone: Diorama_Abdhaljs-Ghelsba
--
-----------------------------------
local ID = require("scripts/zones/Diorama_Abdhaljs-Ghelsba/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
-----------------------------------

function onInitialize(zone)
end

function onZoneIn(player, prevZone)
    local cs = -1

    if not player:hasKeyItem(tpz.ki.MAP_OF_DIO_ABDHALJS_GHELSBA) then
        npcUtil.giveKeyItem(player, tpz.ki.MAP_OF_DIO_ABDHALJS_GHELSBA)
    end

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-200, -10, 252, 131)
    end

    return cs
end

function onRegionEnter(player, region)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
