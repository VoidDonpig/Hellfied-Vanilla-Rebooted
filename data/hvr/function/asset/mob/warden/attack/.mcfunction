#> hvr:asset/mob/warden/attack/
#
# Attack process
#
# @within function hvr:entity_manager/mob/event/attack/dispatch/m

# Destray enemy
    execute if data storage hvr:asset/context {damage_type:"is_melee"} as @n[type=#hvr:living,tag=hvr.victim,tag=!hvr.death] run function hvr:asset/mob/warden/attack/destroy_victim