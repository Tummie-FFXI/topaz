-----------------------------------
-- Geomancer helpers
-----------------------------------
require("scripts/globals/pets")
require("scripts/globals/status")
-----------------------------------

tpz = tpz or {}
tpz.geo = tpz.geo or {}

tpz.geo.spawnLuopan = function(player, aura_effect, tick_effect)
    -- Spawn only a single luopan at a time
    player:despawnPet()
    tpz.pet.spawnPet(player, tpz.pet.id.LUOPAN)

    -- Attach effect
    local luopan = player:getPet()
    luopan:addStatusEffectEx(aura_effect, tpz.effect.COLURE_ACTIVE, 10, 3, 0, tick_effect, 10, 0, tpz.effectFlag.AURA)

    -- Set HP loss over time
    luopan:addMod(tpz.mod.REGEN_DOWN, 24);
end
