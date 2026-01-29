#> hvr:entity_manager/object/call_fn/m
#
# Call fn
#
# @within function vr:entity_manager/object/call_fn/_

# Macro
    $function hvr:asset/object/$(id)/$(called_fn)/_
    $execute store success storage hvr:asset/object impl byte 1 run schedule function hvr:asset/object/$(id)/$(called_fn)/_ 2147483647t
    $schedule clear hvr:asset/object/$(id)/$(called_fn)/_