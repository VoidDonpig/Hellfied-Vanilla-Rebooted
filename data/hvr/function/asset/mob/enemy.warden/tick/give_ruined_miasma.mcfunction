#> hvr:asset/mob/enemy.warden/tick/give_ruined_miasma
#
# Give ruined miasma to entity excepted warden
#
# @within function hvr:asset/mob/enemy.warden/tick/

# Give effect
    data modify storage hvr:api __input__.id set value "ruined_miasma"
    data modify storage hvr:api __input__.duration set value 1200d
    function hvr:api/effect/give

# SFX
    execute anchored eyes positioned ^ ^ ^ run particle sonic_boom ~ ~ ~ 0.0 0.0 0.0 0 1
    execute anchored eyes positioned ^ ^ ^ run particle soul ~ ~ ~ 0.0 0.0 0.0 0.2 6
    execute anchored eyes positioned ^ ^ ^ run playsound block.sculk_shrieker.shriek hostile @a[distance=..16] ~ ~ ~ 1 2