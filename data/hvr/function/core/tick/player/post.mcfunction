#> hvr:core/tick/player/post
#
# Player post tick
#
# @within function hvr:core/tick/main

# Death event
    execute if score @s hvr.death_event matches 1.. run function hvr:entity_manager/player/event/death/handler