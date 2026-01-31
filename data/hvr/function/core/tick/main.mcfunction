#> hvr:core/tick/main
#
# Main tick prpcess
#
# @within tag/function minecraft:tick

# Get time
    execute store result storage hvr:global time int 1 run time query gametime

# Player pre tick
    execute as @a at @s run function hvr:core/tick/player/pre

# Mob pre tick
    execute as @e[type=#hvr:mob,tag=!hvr.no_process_mob] at @s run function hvr:core/tick/mob/pre

# Player tick
    execute as @a at @s run function hvr:core/tick/player/

# Mob initialization
    execute as @e[type=#hvr:mob,tag=!hvr.mob_already_init,tag=!hvr.no_process_mob] at @s run function hvr:entity_manager/mob/init/natural_mob

# Mob tick
    execute as @e[type=#hvr:mob,tag=!hvr.no_process_mob] at @s run function hvr:core/tick/mob/

# World tick
    function hvr:world/tick

# Asset effect tick
    execute as @e[type=#hvr:living,tag=hvr.have_asset_effect] at @s run function hvr:entity_manager/effect/tick

# Player post tick
    execute as @a at @s run function hvr:core/tick/player/post

# Mob post tick
    execute as @e[type=#hvr:mob,tag=!hvr.no_process_mob] at @s run function hvr:core/tick/mob/post