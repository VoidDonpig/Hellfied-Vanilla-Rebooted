#> hvr:asset/mob/zombie_villager/tick
#
# Tick process
#
# @within function hvr:entity_manager/mob/event/tick/dispatch/dispatcher.m

# Force conversion
    execute positioned ~-4 ~-4 ~-4 as @e[type=villager,dx=7,dy=7,dz=7,nbt=!{Invulnerable:1b}] at @s run function hvr:asset/mob/zombie_villager/force_zombification