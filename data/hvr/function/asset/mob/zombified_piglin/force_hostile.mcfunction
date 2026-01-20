#> hvr:asset/mob/zombified_piglin/force_hostile
#
# Make him anger
#
# @within function hvr:asset/mob/zombified_piglin/tick

# Set anger target
    data modify entity @s angry_at set from entity @n[type=#hvr:asset/mob/zombified_piglin/force_hostile_target,tag=!hvr.player_may_exception,distance=..48] UUID

# SFX
    execute anchored eyes positioned ^ ^ ^ run particle angry_villager ~ ~ ~ 0.0 0.0 0.0 0 1
    execute anchored eyes positioned ^ ^ ^ run playsound entity.zombified_piglin.angry hostile @a[distance=..16] ~ ~ ~ 1 0.7