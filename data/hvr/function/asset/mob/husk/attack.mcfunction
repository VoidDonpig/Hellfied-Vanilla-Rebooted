#> hvr:asset/mob/husk/attack
#
# Attack process
#
# @within function hvr:entity_manager/mob/event/attack/dispatch/dispatcher.m

# Give hunger to victim
    execute if data storage hvr:asset/context {damage_type:"is_melee"} as @n[type=#hvr:living,tag=hvr.victim,tag=!hvr.death] at @s run function hvr:asset/mob/husk/give_strong_hunger