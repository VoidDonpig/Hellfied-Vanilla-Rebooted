#> hvr:api/object/core/summon.m
#
# Summon declared object
#
# @within function hvr:api/object/summon

# Register
    function hvr:entity_manager/object/init/register.m with storage hvr:api __input__

# Validation
    execute unless data storage hvr:asset/object id run return run tellraw @a [{storage:"hvr:global",nbt:"prefix.error"},{text:"This id object is not registed: "},{storage:"hvr:api",nbt:"__input__.id"}]
    execute if data storage hvr:asset/object {is_prop:true} run tellraw @a [{storage:"hvr:global",nbt:"prefix.error"},{storage:"hvr:api",nbt:"__input__.id"},{text:" is prop object."}]

# Check props
    execute if data storage hvr:asset/object props[0] run function hvr:entity_manager/object/init/check_prop/_

# Summon object
    execute unless data storage hvr:api __input__{skip_summon:true} run function hvr:entity_manager/object/event/summon/dispatch/dispatcher.m with storage hvr:api __input__

# Init
    execute as @e[tag=hvr.object_need_init,distance=..0.01] run function hvr:entity_manager/object/init/init_asset_object with storage hvr:api __input__