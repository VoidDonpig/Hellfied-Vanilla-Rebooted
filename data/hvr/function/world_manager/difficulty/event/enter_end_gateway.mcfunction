#> hvr:world_manager/difficulty/event/enter_end_gateway
#
# Entering end gateway event
#
# @within advancement hvr:world_manager/difficulty/event/enter_end_gateway

# Update storage data
    data modify storage hvr:world_manager event.enter_end_gateway.achieved set value true

# Update difficulty
    function hvr:world_manager/difficulty/