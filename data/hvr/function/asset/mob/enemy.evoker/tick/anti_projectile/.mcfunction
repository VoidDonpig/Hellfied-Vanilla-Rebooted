#> hvr:asset/mob/enemy.evoker/tick/anti_projectile/
#
# Vanish projectile
#
# @within function vr:asset/mob/enemy.evoker/tick/anti_projectile/check

# SFX
    playsound block.glass.break block @a[distance=..16] ~ ~ ~ 1 2 0
    particle block{block_state:"white_concrete"} ~ ~ ~ 0.3 0.3 0.3 0 4

# Add vanish tag
    tag @s add hvr.vanish