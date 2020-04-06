-----------------------------------------
-- Spell: Indi-Poison
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end


function onSpellCast(caster, target, spell)
    caster:addStatusEffectEx(tpz.effect.INDI_POISON, tpz.effect.COLURE_ACTIVE, 10, 3, 12, tpz.effect.POISON_II, 10, 0, tpz.effectFlag.AURA)
    return tpz.effect.INDI_POISON
end
