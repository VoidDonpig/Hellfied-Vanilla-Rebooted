#> hvr:api/mob/core/summon
#
# Summon declared mob
#
# @within function hvr:api/mob/summon

# Register
    $function hvr:asset/mob/$(id)/register

# Validation
    $execute unless data storage hvr:asset/mob id run return run tellraw @a [{storage:"hvr:global",nbt:"Prefix.Error"},{text:"This id mob is not registed: "},{text:"$(id)",color:"red"}]

# Summon mob
    execute unless data storage hvr:api __input__{skip_summon:true} run function hvr:entity_manager/mob/event/summon/dispatch/dispatcher.m with storage hvr:api __input__

# Field settings
    data modify storage hvr:asset/context this set from storage hvr:asset/mob field
    data modify storage hvr:asset/context this merge from storage hvr:api __input__.field_override

# Init
    execute as @e[tag=hvr.mob_need_init,distance=..0.01] run function hvr:entity_manager/mob/init/init_asset_mob with storage hvr:api __input__