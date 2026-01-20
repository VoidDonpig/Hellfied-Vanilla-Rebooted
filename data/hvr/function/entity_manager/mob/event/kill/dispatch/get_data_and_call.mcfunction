#> hvr:entity_manager/mob/event/kill/dispatch/get_data_and_call
#
# Get data for dispatch
#
# @within function
#   hvr:entity_manager/player/event/hurt/fetch_mob
#   hvr:entity_manager/mob/event/hurt/handler

# this
    tag @s add hvr.this

# Get storage
    function hvr:entity_manager/storage/access

# Set Context
    data modify storage hvr:asset/context id set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].id
    data modify storage hvr:asset/context this set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].mob_field
    
# Call dispatcher
    function hvr:entity_manager/mob/event/kill/dispatch/dispatcher.m with storage hvr:asset/context

# Set field
    function hvr:entity_manager/storage/access
    data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].mob_field set from storage hvr:asset/context this

# Reset
    tag @s remove hvr.this
    data remove storage hvr:asset/context id
    data remove storage hvr:asset/context this