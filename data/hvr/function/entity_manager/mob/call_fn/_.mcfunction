#> hvr:entity_manager/mob/call_fn/_
#
# Call fn
#
# @within function hvr:asset/mob/call_fn

# Call fn with macro
    function hvr:entity_manager/mob/call_fn/m with storage hvr:asset/context

# Call trait method
    execute unless data storage hvr:asset/mob {impl:true} run function hvr:entity_manager/mob/call_fn/prop_method/_