#> hvr:asset/mob/enemy.enderman/tick/force_hostile
#
# Make him anger
#
# @within function hvr:asset/mob/enemy.enderman/tick/

# Set anger target
    data modify entity @s angry_at set from entity @n[type=#hvr:asset/mob/enemy.enderman/force_hostile_target,tag=!hvr.player_may_exception,distance=..16] UUID

# SFX
    execute anchored eyes positioned ^ ^ ^ run particle angry_villager ~ ~ ~ 0.0 0.0 0.0 0 1
    execute anchored eyes positioned ^ ^ ^ run playsound entity.enderman.scream hostile @a[distance=..16] ~ ~ ~ 1 0.7