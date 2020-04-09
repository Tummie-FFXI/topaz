-----------------------------------------
-- Trust: Kupipi
-----------------------------------------
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

-- REACTION ARGS
-- Families, spellIDs etc.
SPELLFAMILY_NONE = 0
SPELLFAMILY_CURE = 1
SPELLFAMILY_PROTECTRA = 2
SPELLFAMILY_SHELLRA = 3
SPELLFAMILY_SLOW = 4
SPELLFAMILY_PARALYZE = 5
SPELLFAMILY_ERASE = 6
SPELLFAMILY_FLASH = 7
SPELLFAMILY_DISPEL = 8
SPELLFAMILY_AERO = 9
SPELLFAMILY_BLIZZARD = 10
SPELLFAMILY_FIRE = 11
SPELLFAMILY_STONE = 12
SPELLFAMILY_THUNDER = 13
SPELLFAMILY_WATER = 14

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

    mob:addBehaviour(PARTY, HPP_LTE, 25, MA, SELECT_HIGHEST, SPELLFAMILY_CURE)

    mob:addBehaviour(PARTY, STATUS, tpz.effect.SLEEP_I, MA, SPECIFIC, CURE_I)
    mob:addBehaviour(PARTY, STATUS, tpz.effect.SLEEP_II, MA, SPECIFIC, CURE_I)

    mob:addBehaviour(PARTY, HPP_LTE, 75, MA, SELECT_HIGHEST, SPELLFAMILY_CURE)

    mob:addBehaviour(PARTY, NOT_STATUS, tpz.effect.PROTECT, MA, SELECT_HIGHEST, SPELLFAMILY_PROTECTRA)
    mob:addBehaviour(PARTY, NOT_STATUS, tpz.effect.SHELL, MA, SELECT_HIGHEST, SPELLFAMILY_SHELLRA)

    mob:addBehaviour(SELF, STATUS_FLAG, tpz.effectFlag.ERASABLE, MA, SELECT_HIGHEST, SPELLFAMILY_ERASE)
    mob:addBehaviour(PARTY, STATUS_FLAG, tpz.effectFlag.ERASABLE, MA, SELECT_HIGHEST, SPELLFAMILY_ERASE)

    mob:addBehaviour(TARGET, STATUS_FLAG, tpz.effectFlag.DISPELABLE, MA, SELECT_HIGHEST, SPELLFAMILY_DISPEL)

    mob:addBehaviour(TARGET, NOT_STATUS, tpz.effect.PARALYSIS, MA, SELECT_HIGHEST, SPELLFAMILY_PARALYZE, 60)
    mob:addBehaviour(TARGET, NOT_STATUS, tpz.effect.SLOW, MA, SELECT_HIGHEST, SPELLFAMILY_SLOW, 60)

    mob:addBehaviour(TARGET, NOT_STATUS, tpz.effect.FLASH, MA, SELECT_HIGHEST, SPELLFAMILY_FLASH, 60)
end
