#> hvr:asset/mob/enemy.drowned/attack/
#
# Attack process
#
# @within function hvr:entity_manager/mob/event/attack/dispatch/m
 
# Remove water breathing from victim
    execute unless data storage hvr:asset/context {damage_type:"is_melee"} unless data storage hvr:asset/context {damage_type:"is_projectile"} run data modify storage hvr.__temp__:asset/mob __temp__.drowned.remove_water_breathing_ok set value false
    execute unless data storage hvr.__temp__:asset/mob __temp__.drowned{remove_water_breathing_ok:false} as @n[type=#hvr:living,tag=hvr.victim,tag=!hvr.death] at @s run function hvr:asset/mob/enemy.drowned/attack/remove_water_breathing
    data remove storage hvr.__temp__:asset/mob __temp__