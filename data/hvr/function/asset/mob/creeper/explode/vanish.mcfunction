#> hvr:asset/mob/creeper/explode/vanish
#
# Vanish creeper
#
# @within function hvr:asset/mob/creeper/explode/exec

# SFX
    execute anchored eyes positioned ^ ^ ^ run playsound block.fire.extinguish hostile @a[distance=..16] ~ ~ ~ 1 0.8

# Tp to void and kill
    tp @s ~ -1024 ~
    kill @s