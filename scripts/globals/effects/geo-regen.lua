-----------------------------------
-- Geo-Regen
-----------------------------------
require("scripts/globals/geo")
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
end

function onEffectTick(target, effect)
    tpz.geo.applyEffectOverArea(target, tpz.effect.REGEN_II, tpz.allegiance.PLAYER)
end

function onEffectLose(target, effect)
end
