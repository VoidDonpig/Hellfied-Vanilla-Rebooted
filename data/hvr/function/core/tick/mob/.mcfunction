#> hvr:core/tick/mob/
#
# Mob tick process
#
# @within function hvr:core/tick/main

# Add specific tag
    tag @s[predicate=hvr:is_on_ground] add hvr.is_on_ground

# Asset mob tick
    execute if entity @s[tag=hvr.asset.mob] run function hvr:entity_manager/mob/tick

# Enemy specific tick process
    execute if entity @s[type=#hvr:enemy/all] run function hvr:core/tick/mob/enemy

# Reset
    tag @s remove hvr.is_on_ground