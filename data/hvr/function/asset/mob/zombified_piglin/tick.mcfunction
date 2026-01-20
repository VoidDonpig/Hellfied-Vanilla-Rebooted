#> hvr:asset/mob/zombified_piglin/tick
#
# Tick process
#
# @within function hvr:entity_manager/mob/event/tick/dispatch/dispatcher.m

# Force hostile
    execute unless predicate hvr:in_hostile if entity @n[type=#hvr:asset/mob/zombified_piglin/force_hostile_target,tag=!hvr.player_may_exception,distance=..48] unless data entity @s angry_at run function hvr:asset/mob/zombified_piglin/force_hostile