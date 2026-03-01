#> hvr:asset/mob/enemy.hazardous.inferno/tick/lava_lay/when_hit
#
# When hit
#
# @within function hvr:asset/mob/enemy.hazardous.inferno/tick/lava_lay/

# Damage
    damage @s 20 lava by @n[tag=hvr.this]

# Give effect
    data modify storage hvr:api __input__.id set value "in_flame"
    data modify storage hvr:api __input__.duration set value 200
    data modify storage hvr:api __input__.level set value 1
    data modify storage hvr:api __input__.duration_operation set value "add"
    data modify storage hvr:api __input__.level_operation set value "force"
    function hvr:api/effect/give

# Reset
    tag @s remove hvr.asset.mob.enemy.hazardous.inferno.lava_lay_hit