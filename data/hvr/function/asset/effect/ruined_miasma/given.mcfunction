#> hvr:asset/effect/ruined_miasma/given
#
# Given event process
#
# @within function
#   hvr:entity_manager/effect/event/given/dispatch/dispatcher.m

# SFX
    execute anchored eyes positioned ^ ^ ^ run particle sonic_boom ~ ~ ~ 0.0 0.0 0.0 0 1
    execute anchored eyes positioned ^ ^ ^ run particle soul ~ ~ ~ 0.0 0.0 0.0 0.2 6
    execute anchored eyes positioned ^ ^ ^ run playsound block.sculk_shrieker.shriek hostile @a[distance=..16] ~ ~ ~ 1 2

# Set attribute
    function hvr:asset/effect/ruined_miasma/set_attribut
    ex