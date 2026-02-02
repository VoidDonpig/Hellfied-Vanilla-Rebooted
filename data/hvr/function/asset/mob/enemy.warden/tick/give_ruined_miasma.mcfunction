#> hvr:asset/mob/enemy.warden/tick/give_ruined_miasma
#
# Give ruined miasma to entity excepted warden
#
# @within function hvr:asset/mob/enemy.warden/tick/

# Give effect
    data modify storage hvr:api __input__.id set value "ruined_miasma"
    data modify storage hvr:api __input__.duration set value 1200d
    function hvr:api/effect/give