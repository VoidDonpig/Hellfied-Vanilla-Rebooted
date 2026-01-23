#> hvr:entity_manager/object/call_fn/_
#
# Call fn
#
# @within function hvr:asset/object/call_fn

# Call fn with macro
    function hvr:entity_manager/object/call_fn/m with storage hvr:asset/context

# Call trait method
    execute unless data storage hvr:asset/object {impl:true} run function hvr:entity_manager/object/call_fn/prop_method/_