#> hvr:entity_manager/mob/enemy/searching_ai/searching
#
# Searching event
#
# @within function hvr:entity_manager/mob/enemy/searching_ai/tick

# SFX
    execute anchored eyes positioned ^ ^ ^ run particle smoke ~ ~ ~ 0.3 0.3 0.3 0.04 1

# If become hostile or out of range, deactivate
    execute unless entity @p[tag=!hvr.player_may_exception,distance=..64] run function hvr:entity_manager/mob/enemy/searching_ai/deactivate
    execute if predicate hvr:in_hostile run function hvr:entity_manager/mob/enemy/searching_ai/deactivate