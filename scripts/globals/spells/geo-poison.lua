-----------------------------------------
-- Spell: Geo-Poison
-----------------------------------------
require("scripts/globals/pets")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end


function onSpellCast(caster, target, spell)
    tpz.pet.spawnPet(caster, tpz.pet.id.LUOPAN)
    local pet = caster:getPet()
    if pet then
    end
    return 0
end
