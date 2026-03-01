#> hvr:asset/mob/enemy.blaze/init/
#
# Init process
#
# @within function hvr:entity_manager/mob/event/init/dispatch/m

# Difficulty modifier
    execute if score $difficulty hvr.world matches 51..99 run function hvr:asset/mob/enemy.blaze/init/difficulty_modifier/1