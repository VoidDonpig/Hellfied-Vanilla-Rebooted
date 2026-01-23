#> hvr:entity_manager/object/init/check_prop/foreach
#
# Check props
#
# @within function
#   hvr:entity_manager/object/init/check_prop/_
#   hvr:entity_manager/object/init/check_prop/foreach

# Get target prop id
    data modify storage hvr.__temp__:asset/object target_prop.id set from storage hvr:asset/object props[0]

# Get data
    function hvr:entity_manager/object/init/register.m with storage hvr.__temp__:asset/object target_prop

# Validation and put id
    execute unless data storage hvr:asset/object {is_prop:true} run tellraw @a [{storage:"hvr:global",nbt:"prefix.error"},{storage:"hvr.__temp__:asset/object",nbt:"target_prop.id"},{text:" is not prop object."}]
    execute if data storage hvr:asset/object {is_prop:true} run data modify storage hvr:core/rom _[-4][-4][-4][-4][-4][-4][-4][-4].object.props append from storage hvr.__temp__:asset/object target_prop.id

# Remove head
    data remove storage hvr:asset/object props[0]

# Loop until finish
    execute if data storage hvr:asset/object props[0] run function hvr:entity_manager/object/init/check_prop/foreach