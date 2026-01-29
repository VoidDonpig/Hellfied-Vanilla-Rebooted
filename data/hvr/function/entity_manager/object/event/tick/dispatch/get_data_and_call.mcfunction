#> hvr:entity_manager/object/event/tick/dispatch/get_data_and_call
#
# Get data for dispatch
#
# @within function

# self
    tag @s add hvr.self

# Get storage
    function hvr:entity_manager/storage/access

# Set Context
    data modify storage hvr:asset/context id set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].id
    
# Call dispatcher
    function hvr:entity_manager/object/event/tick/dispatch/dispatcher.m with storage hvr:asset/context

# Reset
    tag @s remove hvr.self
    data remove storage hvr:asset/context id