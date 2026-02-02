#> hvr:asset/mob/enemy.vindicator/kill/
#
# Kill process
#
# @within function hvr:entity_manager/mob/event/kill/dispatch/m

# Bloodlust effect
    data modify storage hvr:api __input__.id set value "ominous_bloodlust"
    data modify storage hvr:api __input__.duration set value 1200
    data modify storage hvr:api __input__.level set value 1
    data modify storage hvr:api __input__.duration_operation set value "force"
    data modify storage hvr:api __input__.level_operation set value "add"
    function hvr:api/effect/give

# Get regen
    effect give @s regeneration 3 2