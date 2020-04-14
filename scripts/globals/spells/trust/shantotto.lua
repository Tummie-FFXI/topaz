-----------------------------------------
-- Trust: Shantotto
-----------------------------------------
require("scripts/globals/magic")
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

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell, 1019)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    mob:addBehaviour(TARGET, NUKE, 0, MA, SELECT_HIGHEST, tpz.magic.spellFamily.NONE)
end

function onMobDespawn(mob)
end

function onMobDeath(mob)
end
