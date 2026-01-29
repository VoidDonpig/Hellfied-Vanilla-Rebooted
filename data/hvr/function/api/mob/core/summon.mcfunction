#> hvr:api/mob/core/summon.m
#
# Summon declared mob
#
# @within function hvr:api/mob/summon

# Register
    function hvr:entity_manager/mob/init/register.m with storage hvr:api __input__

# Validation
    execute unless data storage hvr:asset/mob id run return run tellraw @a [{storage:"hvr:global",nbt:"prefix.error"},{text:"This id mob is not registed: "},{storage:"hvr:api",nbt:"__input__.id"}]
    execute if data storage hvr:asset/mob {is_prop:true} run return run tellraw @a [{storage:"hvr:global",nbt:"prefix.error"},{storage:"hvr:api",nbt:"__input__.id"},{text:" is prop mob."}]

# Check props
    execute if data storage hvr:asset/mob props[0] run function hvr:entity_manager/mob/init/check_prop/_

# Summon mob
    execute unless data storage hvr:api __input__{skip_summon:true} run function hvr:entity_manager/mob/event/summon/dispatch/dispatcher.m with storage hvr:api __input__

# Field settings
    data modify storage hvr:asset/context self set from storage hvr:asset/mob field
    data modify storage hvr:asset/context self merge from storage hvr:api __input__.field_override

# Init
    execute as @e[tag=hvr.mob_need_init,distance=..0.01] run function hvr:entity_manager/mob/init/init_asset_mob with storage hvr:api __input__