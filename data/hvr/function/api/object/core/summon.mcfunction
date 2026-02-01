#> hvr:api/object/core/summon
#
# Summon declared object
#
# @within function hvr:api/object/summon

# Register
    function hvr:entity_manager/object/summon/register.m with storage hvr:api __input__

# Validation
    execute unless data storage hvr:asset/object id run return run tellraw @a [{storage:"hvr:global",nbt:"prefix.error"},{text:"This id object is not registed: "},{storage:"hvr:api",nbt:"__input__.id"}]

# Summon object
    execute unless data storage hvr:api __input__{skip_summon:true} run function hvr:entity_manager/object/event/summon/dispatch/m with storage hvr:api __input__

# Field settings
    data modify storage hvr:asset/context this set from storage hvr:asset/object field
    data modify storage hvr:asset/context this merge from storage hvr:api __input__.field_override

# Init
    execute as @e[tag=hvr.mob_need_init,distance=..0.01] run function hvr:entity_manager/object/summon/init_asset_mob with storage hvr:api __input__