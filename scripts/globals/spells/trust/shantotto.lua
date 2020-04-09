-----------------------------------------
-- Trust: Shantotto
-----------------------------------------
require("scripts/globals/trust")
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
    return tpz.trust.canCast(caster, spell, 1019)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    mob:addBehaviour(TARGET, NUKE, 0, MA, SELECT_HIGHEST, SPELLFAMILY_NONE)
end

function onMobDespawn(mob)
end

function onMobDeath(mob)
end
