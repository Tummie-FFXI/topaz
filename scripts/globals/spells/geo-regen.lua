-----------------------------------------
-- Spell: Geo-Regen
-----------------------------------------
require("scripts/globals/geo")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end


function onSpellCast(caster, target, spell)
    tpz.geo.spawnLuopan(caster, tpz.effect.INDI_POISON, tpz.effect.REGEN_II)
end
