-----------------------------------
-- Geomancer helpers
-----------------------------------
require("scripts/globals/pets")
require("scripts/globals/status")
-----------------------------------

tpz = tpz or {}
tpz.geo = tpz.geo or {}

tpz.geo.spawnLuopan = function(player, effect)
    -- Spawn only a single luopan at a time
    player:despawnPet()
    tpz.pet.spawnPet(player, tpz.pet.id.LUOPAN)

    -- Attach effect
    local luopan = player:getPet()
    luopan:addStatusEffectEx(tpz.effect.COLURE_ACTIVE, tpz.effect.COLURE_ACTIVE, 0, 3, 12, effect, 10, 0, tpz.effectFlag.AURA)

    -- Set HP loss over time
    luopan:addMod(tpz.mod.REGEN_DOWN, 24);
end
