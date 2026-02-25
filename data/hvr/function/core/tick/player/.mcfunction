#> hvr:core/tick/player/
#
# Player tick process
#
# @within function hvr:core/tick/main

# Event handler
    execute if score @s hvr.first_join_event matches 1 run function hvr:entity_manager/player/event/first_join/handler
    execute if score @s hvr.rejoin_event matches 1.. run function hvr:entity_manager/player/event/rejoin/handler
    execute if score @s hvr.respawn_event matches 1 run function hvr:entity_manager/player/event/respawn/handler