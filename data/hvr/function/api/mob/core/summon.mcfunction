#> hvr:api/mob/core/summon
#
# Summon declared mob
#
# @within function hvr:api/mob/summon

# Register
    function hvr:entity_manager/mob/summon/register.m with storage hvr:api __input__

# Validation
    execute unless data storage hvr:asset/mob id run return run tellraw @a [{storage:"hvr:global",nbt:"prefix.error"},{text:"This id mob is not registed: "},{storage:"hvr:api",nbt:"__input__.id"}]

# Summon mob
    execute unless data storage hvr:api __input__{skip_summon:true} run function hvr:entity_manager/mob/event/summon/dispatch/m with storage hvr:api __input__

# Field settings
    data modify storage hvr:asset/context this set from storage hvr:asset/mob field
    data modify storage hvr:asset/context this merge from storage hvr:api __input__.field_override

# Init
    execute as @e[tag=hvr.mob_need_init,distance=..0.01] run function hvr:entity_manager/mob/init/init_asset_mob with storage hvr:api __input__