-----------------------------------------
-- Spell: Indi-Regen
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end


function onSpellCast(caster, target, spell)
    return tpz.effect.INDI_REGEN
end
