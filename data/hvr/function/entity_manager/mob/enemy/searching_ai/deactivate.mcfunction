#> hvr:entity_manager/mob/enemy/searching_ai/deactivate
#
# Deactivate searching ai
#
# @within function hvr:entity_manager/mob/enemy/searching_ai/tick

# Remove AI
    execute on passengers if entity @n[tag=hvr.enemy_searching_ai] run function hvr:lib/vanish/

# Remove tag
    tag @s remove hvr.enemy_searching_ai_active