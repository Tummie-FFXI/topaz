---------------------------------------------------------------------------------------------------
-- func: setallegiance
-- desc: Sets the players allegiance.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "si"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!setrank <player> <allegiance>")
end

function onTrigger(player, target, allegiance)
    if target == nil then
        error(player, "Set who's allegiance?")
        return
    end

    local targ = GetPlayerByName(target)

    if targ == nil then
        error(player, string.format("Cannot find player: %s.", target))
        return
    end

    if allegiance == nil or ( allegiance < 0 or allegiance > 4 ) then
        error(player, "Improper allegiance passed. Valid Values: 0 to 4")
        return
    end
    player:PrintToPlayer(string.format("You set %s's allegiance to %d", target, allegiance))
    targ:setAllegiance(allegiance)
end
