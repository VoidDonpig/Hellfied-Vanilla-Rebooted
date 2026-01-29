#> hvr:entity_manager/mob/init/check_prop/_
#
# Prop check
#
# @within function hvr:api/mob/core/summon

# Store origin id
    data modify storage hvr.__temp__:asset/mob origin_id set from storage hvr:asset/mob id

# Get address
    data modify storage hvr:core/rom __input__.address set from storage hvr:asset/mob id

# Get storage
    function hvr:core/rom/access

# Check props and put
    data remove storage hvr:core/rom _[-4][-4][-4][-4][-4][-4][-4][-4].mob.props
    function hvr:entity_manager/mob/init/check_prop/foreach

# Restore id
    data modify storage hvr:asset/mob id set from storage hvr.__temp__:asset/mob origin_id

# Reset
    data remove storage hvr:asset/mob props
    data remove storage hvr.__temp__:asset/mob origin_id
    data remove storage hvr.__temp__:asset/mob target_prop