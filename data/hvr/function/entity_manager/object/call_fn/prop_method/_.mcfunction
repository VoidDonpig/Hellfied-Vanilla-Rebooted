#> hvr:entity_manager/object/call_fn/prop_method/_
#
# Call trait method
#
# @within function hvr:entity_manager/object/call_fn/_

# Get address
    data modify storage hvr:core/rom __input__.address set from storage hvr:asset/context id
    
# Access rom 
    function hvr:core/rom/access

# Stash id
    data modify storage hvr:asset/context id_stash set from storage hvr:asset/context id

# Copy props
    data modify storage hvr:asset/object copied_props set value []
    data modify storage hvr:asset/object copied_props set from storage hvr:core/rom _[-4][-4][-4][-4][-4][-4][-4][-4].object.props

# Run prop method
    execute if data storage hvr:asset/object copied_props[0] run function hvr:entity_manager/object/call_fn/prop_method/foreach

# Restore id
    data modify storage hvr:asset/context id set from storage hvr:asset/context id_stash

# Reset
    data remove storage hvr:asset/object copied_props
    data remove storage hvr:asset/object target_trait
    data remove storage hvr:asset/context id_stash