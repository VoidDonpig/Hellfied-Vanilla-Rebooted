#> hvr:core/tick/main
#
# Main tick prpcess
#
# @within tag/function minecraft:tick

# Player pre tick
    execute as @a at @s run function hvr:core/tick/player/pre

# Mob pre tick
    execute as @e[type=#hvr:mob,tag=!hfv.no_process_mob] at @s run function hvr:core/tick/mob/pre

# Player tick
    execute as @a at @s run function hvr:core/tick/player

# Mob initialization
    execute as @e[type=#hvr:mob,tag=!hvr.mob_already_init,tag=!hfv.no_process_mob] at @s run function hvr:entity_manager/mob/init/natural_mob

# Mob tick
    execute as @e[type=#hvr:mob,tag=!hfv.no_process_mob] at @s run function hvr:core/tick/mob

# World tick
    function hvr:world/tick

# Mob post tick
    execute as @e[type=#hvr:mob,tag=!hfv.no_process_mob] at @s run function hvr:core/tick/mob/post