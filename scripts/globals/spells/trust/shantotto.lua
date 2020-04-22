-----------------------------------------
-- Trust: Shantotto
-----------------------------------------
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/trust")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell, 1019)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    mob:addGambit(TARGET, MB_AVAILABLE, 0, MA, SELECT_MB_ELEMENT, tpz.magic.spellFamily.NONE)

    mob:addGambit(TARGET, NUKE, 0, MA, SELECT_HIGHEST, tpz.magic.spellFamily.NONE)
end
