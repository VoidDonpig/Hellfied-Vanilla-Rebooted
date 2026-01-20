#> hvr:asset/mob/stray/give_strong_slowness
#
# Give strong slowness effect to executor
#
# @within function hvr:asset/mob/stray/attack

# Give effect
    effect give @s slowness 30 1

# SFX
    execute anchored eyes positioned ^ ^ ^ run particle snowflake ~ ~ ~ 0.3 0.4 0.3 0 16
    execute anchored eyes positioned ^ ^ ^ run playsound entity.player.hurt_freeze hostile @a[distance=..16] ~ ~ ~ 1 0.7