#> hvr:entity_manager/mob/enemy/searching_ai/tick
#
# Searching ai tick
#
# @within function hvr:core/tick/mob/enemy

# If not hostile while player nearby, activate
    execute if entity @s[tag=!hvr.enemy_searching_ai_active] unless predicate hvr:in_hostile if entity @p[tag=!hvr.player_may_exception,distance=..64] run function hvr:entity_manager/mob/enemy/searching_ai/activate

# Searching event
    execute if entity @s[tag=hvr.enemy_searching_ai_active] run function hvr:entity_manager/mob/enemy/searching_ai/searching