#> hvr:entity_manager/player/event/first_join/handler
#
# First join event handler
#
# @within function hvr:core/tick/player/

# Allocate id
    execute unless score @s hvr.player_id matches 1.. run function hvr:entity_manager/player/provide_id

# Common join event
    function hvr:entity_manager/player/event/join/handler