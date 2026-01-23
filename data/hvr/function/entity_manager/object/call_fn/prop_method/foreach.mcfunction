#> hvr:entity_manager/object/call_fn/prop_method/foreach
#
# Call prop method
#
# @within function 
#   hvr:entity_manager/object/call_fn/prop_method/_
#   hvr:entity_manager/object/call_fn/prop_method/foreach

# Get target prop id
    data modify storage hvr:asset/context id set from storage hvr:asset/object copied_props[0]

# Prop method
    function hvr:entity_manager/object/call_fn/m with storage hvr:asset/context

# Remove head
    data remove storage hvr:asset/object copied_props[0]

# Loop until finish
    execute unless data storage hvr:asset/object {impl:true} if data storage hvr:asset/object copied_props[0] run function hvr:entity_manager/object/call_fn/prop_method/foreach
