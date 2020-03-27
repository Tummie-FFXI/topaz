-----------------------------------
-- Geo-Poison
-----------------------------------
require("scripts/globals/geo")
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
end

function onEffectTick(target, effect)
    tpz.geo.applyEffectOverArea(target, tpz.effect.POISON_II)
end

function onEffectLose(target, effect)
end
