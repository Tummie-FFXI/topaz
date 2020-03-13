-----------------------------------
-- Ability: Cover
-- Allows you to protect party members by placing yourself between them and the enemy.
-- Obtained: Paladin Level 35
-- Recast Time: 3:00
-- Duration: 0:15 (base)
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/utils")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
    if target:getID() == player:getID() or not target:isPC() then
        return tpz.msg.basic.CANNOT_ON_THAT_TARG
    else
        return 0
    end
end

function onUseAbility(player, target, ability)
    local baseDuration = 15
    local bonusTime = utils.clamp(math.floor((player:getMod(tpz.mod.VIT) + player:getMod(tpz.mod.MND) - target:getMod(tpz.mod.VIT) * 2) / 4), 0, 15)
    local duration = baseDuration + bonusTime

    player:addStatusEffect(tpz.effect.COVER, 0, 0, duration)
    target:setLocalVar("COVER", player:getID())
    target:timer(duration * 1000, function(target)
        target:setLocalVar("COVER", 0)
    end)
end
