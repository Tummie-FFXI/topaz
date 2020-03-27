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
    luopan:addStatusEffectEx(effect, tpz.effect.COLURE_ACTIVE, 100, 3, 600)

    -- Set HP loss over time
end

tpz.geo.applyEffectOverArea = function(target, effect)
    local nearbyTargets = target:getTargetsWithinArea(12, 8)
    for _, t in ipairs(nearbyTargets) do
        print(t:getName())
    end
end
