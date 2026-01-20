#> hvr:entity_manager/player/event/hurt/filter/start
#
# Start filter mob
#
# @within function hvr:entity_manager/player/event/hurt/on_hurt_by_mob

# Add victim tag
    tag @s add hvr.player_victim
    # Killed tag
        execute if entity @s[nbt={Health:0f}] run tag @s add hvr.player_killed
        
# Start filter
    execute as @e[type=#hvr:mob] run function hvr:entity_manager/player/event/hurt/filter/15

# Remove tag
    tag @s remove hvr.player_victim
    tag @s remove hvr.player_killed