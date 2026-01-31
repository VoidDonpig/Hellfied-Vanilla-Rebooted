#> hvr:asset/mob/parched/attack/give_strong_weakness
#
# Give strong weakness effect to executor
#
# @within function hvr:asset/mob/parched/attack/

# Give effect
    effect give @s weakness 10 1

# SFX
    execute anchored eyes positioned ^ ^ ^ run particle block{block_state:"sandstone"} ~ ~ ~ 0.3 0.4 0.3 0 16
    execute anchored eyes positioned ^ ^ ^ run playsound entity.zombie.infect hostile @a[distance=..16] ~ ~ ~ 1 0.7