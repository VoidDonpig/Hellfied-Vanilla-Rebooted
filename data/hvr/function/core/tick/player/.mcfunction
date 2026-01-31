#> hvr:core/tick/player/
#
# Player tick process
#
# @within function hvr:core/tick/main

# Allocate id
    execute unless score @s hvr.player_id matches 1.. run function hvr:entity_manager/player/provide_id

# Event handler
    execute if score @s hvr.respawn_event matches 1 run function hvr:entity_manager/player/event/respawn/handler