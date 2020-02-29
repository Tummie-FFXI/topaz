---------------------------------------------------------------------------------------------------
-- func: spawn
-- desc: GEO testing
---------------------------------------------------------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/pets")
-----------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
    tpz.pet.spawnPet(player, tpz.pet.id.LUOPAN)
end
