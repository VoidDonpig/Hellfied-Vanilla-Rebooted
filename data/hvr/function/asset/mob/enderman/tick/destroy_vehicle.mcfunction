#> hvr:asset/mob/enderman/tick/destroy_vehicle
#
# Destroy boats and minecart
#
# @within function hvr:asset/mob/enderman/tick/in_hostile

# SFX
    execute anchored eyes positioned ^ ^ ^ run particle dragon_breath ~ ~ ~ 0.2 0.4 0.2 0.04 16
    execute anchored eyes positioned ^ ^ ^ run particle sweep_attack ~ ~ ~ 0.0 0.0 0.0 0 1
    execute anchored eyes positioned ^ ^ ^ run playsound entity.player.attack.strong hostile @a[distance=..16] ~ ~ ~ 1 0.7
    execute anchored eyes positioned ^ ^ ^ run playsound entity.player.attack.sweep hostile @a[distance=..16] ~ ~ ~ 1 0.8

# Damage itself
    damage @s 9999 mob_attack by @n[type=enderman,tag=hvr.this]