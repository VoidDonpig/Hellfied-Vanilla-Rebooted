#> hvr:asset/mob/warden/tick
#
# Tick process
#
# @within function hvr:entity_manager/mob/event/tick/dispatch/dispatcher.m

# In hostile tick
    execute if predicate hvr:in_hostile if data entity @s anger.suspects[0] run function hvr:asset/mob/warden/in_hostile