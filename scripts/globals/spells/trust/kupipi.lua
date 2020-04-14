-----------------------------------------
-- Trust: Kupipi
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/trust")
require("scripts/globals/utils")
require("scripts/globals/zone")
-----------------------------------------

-- TODO

-- SELECTORS
SELF = 0
PARTY = 1
TARGET = 2

-- TRIGGERS
HPP_LTE = 0
HPP_GTE = 1
MPP_LTE = 2
TP_GTE = 3
STATUS = 4
NOT_STATUS = 5
STATUS_FLAG = 6
NUKE = 7
CAN_SC = 8
CAN_MB = 9

-- REACTION
ATTACK = 0
ASSIST = 1
MA = 2
JA = 3
WS = 4

-- REACTION MODIFIERS
SELECT_HIGHEST = 0
SELECT_LOWEST = 1
SPECIFIC = 2

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

    mob:addBehaviour(PARTY, HPP_LTE, 25, MA, SELECT_HIGHEST, tpz.magic.spellFamily.CURE)

    mob:addBehaviour(PARTY, STATUS, tpz.effect.SLEEP_I, MA, SPECIFIC, CURE_I)
    mob:addBehaviour(PARTY, STATUS, tpz.effect.SLEEP_II, MA, SPECIFIC, CURE_I)

    mob:addBehaviour(PARTY, HPP_LTE, 75, MA, SELECT_HIGHEST, tpz.magic.spellFamily.CURE)

    mob:addBehaviour(PARTY, NOT_STATUS, tpz.effect.PROTECT, MA, SELECT_HIGHEST, tpz.magic.spellFamily.PROTECTRA)
    mob:addBehaviour(PARTY, NOT_STATUS, tpz.effect.SHELL, MA, SELECT_HIGHEST, tpz.magic.spellFamily.SHELLRA)

    mob:addBehaviour(SELF, STATUS_FLAG, tpz.effectFlag.ERASABLE, MA, SPECIFIC, ERASE)
    mob:addBehaviour(PARTY, STATUS_FLAG, tpz.effectFlag.ERASABLE, MA, SPECIFIC, ERASE)

    mob:addBehaviour(TARGET, STATUS_FLAG, tpz.effectFlag.DISPELABLE, MA, SPECIFIC, DISPEL)

    mob:addBehaviour(TARGET, NOT_STATUS, tpz.effect.PARALYSIS, MA, SELECT_HIGHEST, tpz.magic.spellFamily.PARALYZE, 60)
    mob:addBehaviour(TARGET, NOT_STATUS, tpz.effect.SLOW, MA, SELECT_HIGHEST, tpz.magic.spellFamily.SLOW, 60)

    mob:addBehaviour(TARGET, NOT_STATUS, tpz.effect.FLASH, MA, SPECIFIC, FLASH, 60)
end
