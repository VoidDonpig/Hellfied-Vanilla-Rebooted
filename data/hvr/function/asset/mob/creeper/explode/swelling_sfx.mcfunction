#> hvr:asset/mob/creeper/explode/swelling_sfx
#
# Swelling SFX
#
# @within function hvr:asset/mob/creeper/explode/swell

# SFX
    execute if score @s hvr.mob_asset.creeper.swell matches 1 anchored eyes positioned ^ ^ ^ run playsound entity.creeper.hurt hostile @a[distance=..16] ~ ~ ~ 1 0.5
    execute if score @s hvr.mob_asset.creeper.swell matches 5 anchored eyes positioned ^ ^ ^ run playsound entity.creeper.hurt hostile @a[distance=..16] ~ ~ ~ 1 0.6
    execute if score @s hvr.mob_asset.creeper.swell matches 9 anchored eyes positioned ^ ^ ^ run playsound entity.creeper.hurt hostile @a[distance=..16] ~ ~ ~ 1 0.7
    execute if score @s hvr.mob_asset.creeper.swell matches 13 anchored eyes positioned ^ ^ ^ run playsound entity.creeper.hurt hostile @a[distance=..16] ~ ~ ~ 1 0.8
    execute if score @s hvr.mob_asset.creeper.swell matches 17 anchored eyes positioned ^ ^ ^ run playsound entity.creeper.hurt hostile @a[distance=..16] ~ ~ ~ 1 0.9
    execute if score @s hvr.mob_asset.creeper.swell matches 21 anchored eyes positioned ^ ^ ^ run playsound entity.creeper.hurt hostile @a[distance=..16] ~ ~ ~ 1 1.1
    execute if score @s hvr.mob_asset.creeper.swell matches 25 anchored eyes positioned ^ ^ ^ run playsound entity.creeper.hurt hostile @a[distance=..16] ~ ~ ~ 1 1.2
    execute anchored eyes positioned ^ ^ ^ run particle electric_spark ~ ~ ~ 0.3 0.3 0.3 0.08 4