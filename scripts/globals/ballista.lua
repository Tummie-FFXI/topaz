-----------------------------------
-- Ballista
-----------------------------------
require("scripts/globals/keyitems")
-----------------------------------

tpz = tpz or {}
tpz.ballista = tpz.ballista or {}

tpz.ballista.gameState = {
    RULES_BEING_SET = 1,
    ACCEPTING_ENTRIES = 2,
    BRIEFING = 3,
    IN_PROGRESS = 4,
    CANCELLED = 5,
    ENDED = 6
}

-- TODO: base this on db info and update every vana-minute
tpz.ballista.gameZones = {
    [tpz.zone.JUGNER_FOREST] = tpz.ballista.gameState.RULES_BEING_SET,
    [tpz.zone.PASHHOW_MARSHLANDS] = tpz.ballista.gameState.RULES_BEING_SET,
    [tpz.zone.MERIPHATAUD_MOUNTAINS] = tpz.ballista.gameState.RULES_BEING_SET,
    [tpz.zone.DIORAMA_ABDHALJS_GHELSBA] = tpz.ballista.gameState.RULES_BEING_SET
}

tpz.ballista.entryFee = 750

tpz.ballista.getZoneGameState = function(zone)
    return tpz.ballista.gameZones[zone]
end

tpz.ballista.quarry = function(player)
    local ballistaBand = player:hasKeyItem(tpz.ki.BALLISTA_BAND) -- Gives the option of keeping or discarding the first Petra dug up.
    local ballistaEarring = player:hasKeyItem(tpz.ki.BALLISTA_EARRING) --  Gives information about upcoming matches once per Vana'diel day when the wearer zones into an area where a Pursuivant is present. Also gives hints and tips during the match.
    local ballistaInstaWarp = player:hasKeyItem(tpz.ki.BALLISTA_INSTAWARP) -- Teleports you to an upcoming match after speaking to a Pursuivant.
    local ballistaInstaPort = player:hasKeyItem(tpz.ki.BALLISTA_INSTAPORT) -- Transports you to your Home Point after speaking to a Pursuivant.
    local petraShovel = player:hasKeyItem(tpz.ki.PETRA_SHOVEL) -- All temporary items dug up are automatically put into your inventory without any prompt. If your temporary item inventory is full, the item dug up will be automatically discarded.

    local rand = math.random(0, 99)
    if rand >= 90 then -- Petra!
        player:startEvent(5)
    else
        player:startEvent(4)
    end
end

tpz.ballista.onRookTrigger = function(player, npc)
end
