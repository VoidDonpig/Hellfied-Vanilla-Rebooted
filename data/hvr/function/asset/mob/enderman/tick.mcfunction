#> hvr:asset/mob/enderman/tick
#
# Tick process
#
# @within function hvr:entity_manager/mob/event/tick/dispatch/dispatcher.m

# In hostile tick
    execute if predicate hvr:in_hostile run function hvr:asset/mob/enderman/in_hostile

# Force hostile
    execute unless predicate hvr:in_hostile if entity @n[type=#hvr:asset/mob/enderman/force_hostile_target,tag=!hvr.player_may_exception,predicate=!hvr:asset/mob/enderman/is_wearing_pumpkin,distance=..16] unless data entity @s angry_at run function hvr:asset/mob/enderman/force_hostile
    # If wearing pumpkin. reduce range
        execute unless predicate hvr:in_hostile if entity @n[type=#hvr:asset/mob/enderman/force_hostile_target,tag=!hvr.player_may_exception,predicate=hvr:asset/mob/enderman/is_wearing_pumpkin,distance=..4] unless data entity @s angry_at run function hvr:asset/mob/enderman/force_hostile

# If target wearing pumokin nearby, playsound
    execute unless predicate hvr:in_hostile if predicate hvr:interval/80t if entity @n[type=#hvr:asset/mob/enderman/force_hostile_target,tag=!hvr.player_may_exception,predicate=hvr:asset/mob/enderman/is_wearing_pumpkin,distance=4..16] unless data entity @s angry_at anchored eyes positioned ^ ^ ^ run playsound entity.enderman.ambient hostile @a[distance=..16] ~ ~ ~ 2 0.7