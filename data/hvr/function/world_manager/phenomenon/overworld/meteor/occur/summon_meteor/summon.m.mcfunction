#> hvr:world_manager/phenomenon/overworld/meteor/occur/summon_meteor/summon.m
#
# Summon fake flash object
#
# @within function hvr:world_manager/phenomenon/overworld/meteor/occur/summon_meteor/

# Add target tag
    tag @s add hvr.world.meteor_target

# Summon
    data modify storage hvr:api __input__.id set value "world.meteor"
    data modify storage hvr:api __input__.field_override.target set value "@p[tag=hvr.world.meteor_target]"
    $execute positioned ~$(x) ~256 ~$(z) run function hvr:api/object/summon

# Reset
    tag @s remove hvr.world.meteor_target