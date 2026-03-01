#> hvr:asset/mob/enemy.hazardous.inferno/damaged/
#
# Damaged process
#
# @within function
#   hvr:entity_manager/mob/event/damaged/dispatch/m
#   hvr:asset/mob/enemy.hazardous.inferno/hurt/

# SFX
    playsound entity.blaze.hurt hostile @a[distance=..16] ~ ~ ~ 1 0.5
    playsound entity.wither.hurt hostile @a[distance=..16] ~ ~ ~ 0.2 1.2
    playsound block.fire.extinguish hostile @a[distance=..16] ~ ~ ~ 0.4 2
    playsound block.tuff.break hostile @a[distance=..16] ~ ~ ~ 0.8 0.7