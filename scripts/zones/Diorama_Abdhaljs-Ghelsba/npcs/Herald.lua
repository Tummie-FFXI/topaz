-----------------------------------
-- Area: Diorama Abdhaljs-Ghelsba
--  NPC: Herald
-- !pos -203.652 -10.000 252.509 43
-----------------------------------
local ID = require("scripts/zones/Diorama_Abdhaljs-Ghelsba/IDs")
require("scripts/globals/ballista")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local gamePhase = tpz.ballista.getZoneGameState(player:getZoneID())

    -- 2 -I am now accepting applications for participation in today's match
    -- 6 - You are recognized as the MC for today
    -- 7 - Request a discharge?
    -- 8 - What would you like to do? [CHOICES] Nothing.Use Ballista Royale rules.
    -- 15 - You are already a[ / temporary ]member of the [Wyverns/Griffons].

    -- 2 -I am now accepting applications for participation in today's match
    local memberOfTeam = 0
    local wyvernsOrGriffons = 1 -- wyverns = 0, griffons = 1
    local entryType = 0 -- 0 = free, 1 = open, 2 = auto-balance, 3 = random-shuffle
    local mcTemporaryWarning = 2 -- >=3 is no MC Warning
    --player:startEvent(2, memberOfTeam, wyvernsOrGriffons, entryType, mcTemporaryWarning)

    local mcStatus = 8 -- 0 = Yet to show, 4 = failed to show, 8 = MC selected
    local mcID = player:getID()
    local wyvernsMembers = 0
    local matchRulesAreBeingSet = 2
    --player:startEvent(7, mcStatus, wyvernsMembers, mcID, matchRulesAreBeingSet, mcID, mcID, mcID, mcID)

    -- player:entityVisualPacket(315)
    player:injectActionPacket(1, 315, 0, 0, 0)
end

function onEventUpdate(player, csid, option)
    player:PrintToPlayer(string.format("Update: %s, %s", csid, option))

    if csid == 2 and option == 0 then
    elseif csid == 7 and option == 0 then
    end
end

function onEventFinish(player, csid, option)
    player:PrintToPlayer(string.format("End: %s, %s", csid, option))
end
