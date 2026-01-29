#> hvr:entity_manager/mob/init/check_prop/foreach
#
# Check props
#
# @within function
#   hvr:entity_manager/mob/init/check_prop/_
#   hvr:entity_manager/mob/init/check_prop/foreach

# Get target prop id
    data modify storage hvr.__temp__:asset/mob target_prop.id set from storage hvr:asset/mob props[0]

# Get data
    function hvr:entity_manager/mob/init/register.m with storage hvr.__temp__:asset/mob target_prop

# Validation and put id
    execute unless data storage hvr:asset/mob {is_prop:true} run tellraw @a [{storage:"hvr:global",nbt:"prefix.error"},{storage:"hvr.__temp__:asset/mob",nbt:"target_prop.id"},{text:" is not prop mob."}]
    execute if data storage hvr:asset/mob {is_prop:true} run data modify storage hvr:core/rom _[-4][-4][-4][-4][-4][-4][-4][-4].mob.props append from storage hvr.__temp__:asset/mob target_prop.id

# Remove head
    data remove storage hvr:asset/mob props[0]

# Loop until finish
    execute if data storage hvr:asset/mob props[0] run function hvr:entity_manager/mob/init/check_prop/foreach