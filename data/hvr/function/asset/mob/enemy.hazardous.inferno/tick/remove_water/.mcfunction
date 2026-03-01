#> hvr:asset/mob/enemy.hazardous.inferno/tick/remove_water/
#
# Remove water
#
# @within function hvr:asset/mob/enemy.hazardous.inferno/tick/

# SFX
    particle white_smoke ~ ~1 ~ 0.6 1.0 0.6 0 64
    playsound entity.generic.extinguish_fire block @a[distance=..16] ~ ~ ~ 0.9 0.9

# Remove water
    fill ~-1 ~-1 ~-1 ~1 ~2 ~1 air replace water