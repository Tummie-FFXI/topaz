-----------------------------------------
-- Trust: Kupipi
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/gambits")
require("scripts/globals/status")
require("scripts/globals/trust")
require("scripts/globals/utils")
require("scripts/globals/zone")
-----------------------------------------


function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

function onSpellCast(caster, target, spell)
    local WindurstFirstTrust = caster:getCharVar("WindurstFirstTrust")
    local zone = caster:getZoneID()

    if WindurstFirstTrust == 1 and (zone == tpz.zone.EAST_SARUTABARUTA or zone == tpz.zone.WEST_SARUTABARUTA) then
        caster:setCharVar("WindurstFirstTrust", 2)
    end

    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    local CURE_I = 1
    local FLASH  = 112
    local ERASE  = 143
    local DISPEL = 260

    mob:addGambit(PARTY, HPP_LTE, 25, MA, SELECT_HIGHEST, tpz.magic.spellFamily.CURE)

    mob:addGambit(PARTY, STATUS, tpz.effect.SLEEP_I, MA, SELECT_SPECIFIC, CURE_I)
    mob:addGambit(PARTY, STATUS, tpz.effect.SLEEP_II, MA, SELECT_SPECIFIC, CURE_I)

    mob:addGambit(PARTY, HPP_LTE, 75, MA, SELECT_HIGHEST, tpz.magic.spellFamily.CURE)

    mob:addGambit(PARTY, NOT_STATUS, tpz.effect.PROTECT, MA, SELECT_HIGHEST, tpz.magic.spellFamily.PROTECTRA)
    mob:addGambit(PARTY, NOT_STATUS, tpz.effect.SHELL, MA, SELECT_HIGHEST, tpz.magic.spellFamily.SHELLRA)

    mob:addGambit(SELF, STATUS_FLAG, tpz.effectFlag.ERASABLE, MA, SELECT_SPECIFIC, ERASE)
    mob:addGambit(PARTY, STATUS_FLAG, tpz.effectFlag.ERASABLE, MA, SELECT_SPECIFIC, ERASE)

    mob:addGambit(TARGET, STATUS_FLAG, tpz.effectFlag.DISPELABLE, MA, SELECT_SPECIFIC, DISPEL)

    mob:addGambit(TARGET, NOT_STATUS, tpz.effect.PARALYSIS, MA, SELECT_HIGHEST, tpz.magic.spellFamily.PARALYZE, 60)
    mob:addGambit(TARGET, NOT_STATUS, tpz.effect.SLOW, MA, SELECT_HIGHEST, tpz.magic.spellFamily.SLOW, 60)

    mob:addGambit(TARGET, NOT_STATUS, tpz.effect.FLASH, MA, SELECT_SPECIFIC, FLASH, 60)
end
