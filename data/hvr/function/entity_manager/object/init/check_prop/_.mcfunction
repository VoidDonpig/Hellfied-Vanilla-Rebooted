#> hvr:entity_manager/object/init/check_prop/_
#
# Prop check
#
# @within function hvr:api/object/core/summon.m

# Store origin id
    data modify storage hvr.__temp__:asset/object origin_id set from storage hvr:asset/object id

# Get address
    data modify storage hvr:core/rom __input__.address set from storage hvr:asset/object id

# Get storage
    function hvr:core/rom/access

# Check props and put
    data remove storage hvr:core/rom _[-4][-4][-4][-4][-4][-4][-4][-4].object.props
    function hvr:entity_manager/object/init/check_prop/foreach

# Restore id
    data modify storage hvr:asset/object id set from storage hvr.__temp__:asset/object origin_id

# Reset
    data remove storage hvr:asset/object props
    data remove storage hvr.__temp__:asset/object origin_id
    data remove storage hvr.__temp__:asset/object target_prop