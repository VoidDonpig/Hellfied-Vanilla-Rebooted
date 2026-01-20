#> hvr:asset/mob/drowned/remove_water_breathing
#
# Remove water breathing
#
# @within function hvr:asset/mob/drowned/attack

# Remove effect
    effect clear @s water_breathing
    
# SFX
    execute anchored eyes positioned ^ ^ ^ run particle bubble ~ ~ ~ 0.4 0.4 0.4 0 16
    execute anchored eyes positioned ^ ^ ^ run playsound entity.player.hurt_drown hostile @a[distance=..16] ~ ~ ~ 1 0.5