-----------------------------------
-- Geo-Regen
-----------------------------------
require("scripts/globals/geo")
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
end

function onEffectTick(target, effect)
    tpz.geo.applyEffectOverArea(target, effect)
end

function onEffectLose(target,effect)
end