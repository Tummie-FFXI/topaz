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
    caster:addStatusEffectEx(tpz.effect.INDI_REGEN, tpz.effect.COLURE_ACTIVE, 0, 3, 12, tpz.effect.REGEN_II, 10, 0, tpz.effectFlag.AURA)
    return tpz.effect.INDI_REGEN
end
