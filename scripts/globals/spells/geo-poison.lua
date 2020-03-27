-----------------------------------------
-- Spell: Geo-Poison
-----------------------------------------
require("scripts/globals/pets")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end


function onSpellCast(caster, target, spell)
    tpz.geo.spawnLuopan(caster, tpz.effect.INDI_POISON)
end
