#> hvr:world_manager/difficulty/event/get_diamond
#
# Get diamond event
#
# @within advancement hvr:world_manager/difficulty/event/get_diamond

# Update storage data
    data modify storage hvr:world_manager event.get_diamond.achieved set value true

# Update difficulty
    function hvr:world_manager/difficulty/