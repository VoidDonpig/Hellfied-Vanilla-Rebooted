#> hvr:asset/mob/enemy.parched/attack/
#
# Attack process
#
# @within function hvr:entity_manager/mob/event/attack/dispatch/m

# Give strong slowness
    execute if data storage hvr:asset/context {damage_type:"is_projectile"} as @n[type=#hvr:living,tag=hvr.victim,tag=!hvr.death] at @s run function hvr:asset/mob/enemy.parched/attack/give_strong_weakness
