#> hvr:entity_manager/mob/call_fn/m
#
# Call fn
#
# @within function vr:entity_manager/mob/call_fn/_

# Macro
    $function hvr:asset/mob/$(id)/$(called_fn)/_
    $execute store success storage hvr:asset/mob impl byte 1 run schedule function hvr:asset/mob/$(id)/$(called_fn)/_ 2147483647t
    $schedule clear hvr:asset/mob/$(id)/$(called_fn)/_