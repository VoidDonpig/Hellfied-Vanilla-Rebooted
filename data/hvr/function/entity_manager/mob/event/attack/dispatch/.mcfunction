#> hvr:entity_manager/mob/event/attack/dispatch/
#
# Get data for dispatch
#
# @within function hvr:entity_manager/mob/event/hurt/handler

# this
    tag @s add hvr.this

# Get storage
    function hvr:api/storage/entity/fetch

# Set Context
    data modify storage hvr:asset/context id set from storage hvr:entity_manager/storage fetched.id
    data modify storage hvr:asset/context this set from storage hvr:entity_manager/storage fetched.mob_field

# Call dispatcher
    function hvr:entity_manager/mob/event/attack/dispatch/m with storage hvr:asset/context

# Set field
    function hvr:api/storage/entity/fetch
    data modify storage hvr:entity_manager/storage fetched.mob_field set from storage hvr:asset/context this

# Reset
    tag @s remove hvr.this
    data remove storage hvr:asset/context id
    data remove storage hvr:asset/context this