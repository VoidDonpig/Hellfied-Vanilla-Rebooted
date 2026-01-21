#> hvr:asset/mob/creeper/explode/reload_explosion_sfx
#
# Reload explosion sfx
#
# @within function hvr:asset/mob/creeper/explode/exec

# SFX
    particle lava ~ ~ ~ 0.0 0.0 0.0 1 10
    execute anchored eyes positioned ^ ^ ^ run playsound entity.creeper.hurt hostile @a[distance=..16] ~ ~ ~ 1 0.5
    execute anchored eyes positioned ^ ^ ^ run particle smoke ~ ~ ~ 0.4 0.4 0.4 0.08 16
    execute anchored eyes positioned ^ ^ ^ run playsound entity.tnt.primed hostile @a[distance=..16] ~ ~ ~ 1 2
    execute anchored eyes positioned ^ ^ ^ run playsound entity.creeper.primed hostile @a[distance=..16] ~ ~ ~ 1 0.5