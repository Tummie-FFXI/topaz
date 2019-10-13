-----------------------------------
-- Area: The_Sanctuary_of_ZiTah
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.THE_SANCTUARY_OF_ZITAH] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED    = 6382,  -- You cannot obtain the <item>. Come back after sorting your inventory.
        FULL_INVENTORY_AFTER_TRADE = 6386,  -- You cannot obtain the <item>. Try trading again after sorting your inventory.
        ITEM_OBTAINED              = 6388,  -- Obtained: <item>.
        GIL_OBTAINED               = 6389,  -- Obtained <number> gil.
        KEYITEM_OBTAINED           = 6391,  -- Obtained key item: <keyitem>.
        KEYITEM_LOST               = 6392,  -- Lost key item: <keyitem>.
        ITEMS_OBTAINED             = 6397,  -- You obtain <number> <item>!
        NOTHING_OUT_OF_ORDINARY    = 6402,  -- There is nothing out of the ordinary here.
        SENSE_OF_FOREBODING        = 6403,  -- You are suddenly overcome with a sense of foreboding...
        CONQUEST_BASE              = 7049,  -- Tallying conquest results...
        BEASTMEN_BANNER            = 7130,  -- There is a beastmen's banner.
        CONQUEST                   = 7217,  -- You've earned conquest points!
        FISHING_MESSAGE_OFFSET     = 7550,  -- You can't fish here.
        DIG_THROW_AWAY             = 7563,  -- You dig up <item>, but your inventory is full. You regretfully throw the <item> away.
        FIND_NOTHING               = 7565,  -- You dig and you dig, but find nothing.
        SOMETHING_BETTER           = 7733,  -- Don't you have something better to do right now?
        CANNOT_REMOVE_FRAG         = 7736,  -- It is an oddly shaped stone monument. A shining stone is embedded in it, but cannot be removed...
        ALREADY_OBTAINED_FRAG      = 7737,  -- You have already obtained this monument's <keyitem>. Try searching for another.
        FOUND_ALL_FRAGS            = 7739,  -- You have obtained <keyitem>! You now have all 8 fragments of light!
        ZILART_MONUMENT            = 7740,  -- It is an ancient Zilart monument.
        STURDY_BRANCH              = 7763,  -- It is a beautiful, sturdy branch.
        SENSE_OMINOUS_PRESENCE     = 7848,  -- You sense an ominous presence...
        PLAYER_OBTAINS_ITEM        = 8082,  -- Player obtains <item>!
        UNABLE_TO_OBTAIN_ITEM      = 8083,  -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM   = 8084,  -- Player obtains the temporary item: <temp item>!
        ALREADY_POSSESS_TEMP       = 8085,  -- You already possess that temporary item.
        NO_COMBINATION             = 8090,  -- You were unable to enter a combination.
        HUNCH_GREATER_LESS         = 8091,  -- You have a hunch that the lock's combination is ≺0 = GREATER, 1 = LESS≻[greater/less] than ≺INPUT NUMBER≻.
        UNABLE_TO_OPEN_LOCK        = 8092,  -- Player failed to open the lock.
        CORRECT_NUMBER_WAS         = 8093,  -- It appears that the correct combination was ≺RANDOM LOCK NUMBER≻.
        OPENED_LOCK                = 8094,  -- Player succeeded in opening the lock!
        HUNCH_SECOND_EVEN_ODD      = 8095,  -- You have a hunch that the second digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        HUNCH_FIRST_EVEN_ODD       = 8096,  -- You have a hunch that the first digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        COMBINATION_GREATER_LESS   = 8097,  -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻ and less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_LESS_THAN      = 8098,  -- You have a hunch that the combination is less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_GREATER_THAN   = 8099,  -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻.
        ONE_OF_TWO_DIGITS_IS       = 8100,  -- You have a hunch that one of the two digits is ≺PICKED ONE OF THE TWO NUMBERS OF LOCK≻.
        SECOND_DIGIT_IS            = 8101,  -- You have a hunch that the second digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        FIRST_DIGIT_IS             = 8102,  -- You have a hunch that the first digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        UNABLE_TO_GET_HINT         = 8103,  -- You were unable to glean anything from your examination of the lock.
        MONSTER_CONCEALED_CHEST    = 8105,  -- The monster was concealing a treasure chest!
        REGIME_REGISTERED          = 10268, -- New training regime registered!
        COMMON_SENSE_SURVIVAL      = 12257  -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
    },
    mob =
    {
        KEEPER_OF_HALIDOM_PH =
        {
            [17272977] = 17272978, -- 319.939 -0.037 187.231
        },
        NOBLE_MOLD_PH   =
        {
            [17273276] = 17273278, -- -391.184 -0.269 -159.086
            [17273277] = 17273278, -- -378.456 0.425 -162.489
        },
        GUARDIAN_TREANT = 17272838,
        DOOMED_PILGRIMS = 17272839,
        NOBLE_MOLD      = 17273278,
        ISONADE         = 17273285,
        GREENMAN        = 17273295,
    },
    npc =
    {
        CASKET_BASE      = 17273337,
        OVERSEER_BASE    = 17273364,
        CERMET_HEADSTONE = 17273389,
    },
}

return zones[dsp.zone.THE_SANCTUARY_OF_ZITAH]