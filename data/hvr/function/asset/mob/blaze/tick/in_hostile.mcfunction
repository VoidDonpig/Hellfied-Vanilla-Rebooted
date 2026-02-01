#> hvr:asset/mob/blaze/tick/in_hostile
#
# Hostile tick
#
# @within function hvr:asset/mob/blaze/tick/

# Explosive fireball
    execute anchored eyes positioned ^ ^ ^ as @e[type=small_fireball,tag=!hvr.projectile_ticked,distance=..2] at @s run function hvr:asset/mob/blaze/tick/explosive_fireball/search