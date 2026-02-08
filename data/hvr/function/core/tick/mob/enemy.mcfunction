#> hvr:core/tick/mob/enemy
#
# Enemy tick
#
# @within function hvr:core/tick/mob/

# If not boss, attempt to activate searching AI
    execute if entity @s[type=!#hvr:boss,tag=!hvr.no_searching_ai] run function hvr:entity_manager/mob/enemy/searching_ai/tick