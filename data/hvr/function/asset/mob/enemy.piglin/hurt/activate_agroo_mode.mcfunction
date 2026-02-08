#> hvr:asset/mob/enemy.piglin/hurt/activate_agroo_mode
#
# Activate agroo mode
#
# @within function hvr:asset/mob/enemy.piglin/hurt

# SFX
    execute anchored eyes positioned ^ ^ ^ run playsound entity.piglin.angry hostile @a[distance=..32] ~ ~ ~ 2 0.5
    execute anchored eyes positioned ^ ^ ^ run particle angry_villager ~ ~ ~ 0.0 0.0 0.0 0 1

# Give tag
    tag @s add hvr.asset.mob.enemy.piglin_agroo

# Provide searching AI
    tag @s remove hvr.no_searching_ai