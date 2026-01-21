#> hvr:asset/mob/creeper/explode/swelling_start_sfx
#
# SFX
#
# @within function hvr:asset/mob/creeper/explode/swell

# SFX
    particle lava ~ ~ ~ 0.0 0.0 0.0 1 4
    execute anchored eyes positioned ^ ^ ^ run particle smoke ~ ~ ~ 0.4 0.4 0.4 0.08 16
    execute anchored eyes positioned ^ ^ ^ run playsound entity.tnt.primed hostile @a[distance=..16] ~ ~ ~ 1 2