#> hvr:core/tick/mob
#
# Mob tick process
#
# @within function hvr:core/tick/main

# Asset mob tick
    execute if entity @s[tag=hvr.mob_asset] run function hvr:entity_manager/mob/tick

# Enemy specific tick process
    execute if entity @s[type=#hvr:enemy/all] run function hvr:core/tick/mob/enemy