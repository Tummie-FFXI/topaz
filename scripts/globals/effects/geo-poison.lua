-----------------------------------
-- Geo-Poison
-----------------------------------
require("scripts/globals/geo")
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
end

function onEffectTick(target, effect)
    target:addAura(tpz.effect.REGEN_II, 10, 3, 3)
end

function onEffectLose(target, effect)
end
