#> hvr:asset/mob/skeleton/tick
#
# Tick process
#
# @within function hvr:entity_manager/mob/event/tick/dispatch/dispatcher.m

# Piercing shot
    execute anchored eyes positioned ^ ^ ^ as @e[type=#arrows,tag=!hvr.projectile_already_tick,distance=..2] at @s run function hvr:asset/mob/skeleton/piercing_shot/search