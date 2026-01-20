#> hvr:entity_manager/player/event/attack/filter/start
#
# Start filter mob
#
# @within function hvr:entity_manager/player/event/attack/on_attack_mob

# Add attacker tag
    tag @s add hvr.player_attacker

# Start filter
    execute as @e[type=#hvr:mob,nbt=!{HurtTime:0s}] run function hvr:entity_manager/player/event/attack/filter/15

# Remove tag
    tag @s remove hvr.player_attacker