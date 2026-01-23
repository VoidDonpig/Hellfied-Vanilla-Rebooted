#> hvr:asset/object/call_fn
#
# Call fn alias
#
# @within function hvr:asset/object/**

# Get fn
    $data modify storage hvr:asset/context called_fn set value $(fn)

# Call fn
    function hvr:entity_manager/object/call_fn/_