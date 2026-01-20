#> hvr:asset/mob/bogged/attack
#
# Attack process
#
# @within function hvr:entity_manager/mob/event/attack/dispatch/dispatcher.m

# Give strong slowness
    execute if data storage hvr:asset/context {damage_type:"is_projectile"} as @n[tag=hvr.victim,tag=!hvr.death] at @s run function hvr:asset/mob/bogged/give_strong_poison
