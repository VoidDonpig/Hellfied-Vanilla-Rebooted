#> hvr:world_manager/phenomenon/overworld/meteor/occur/fake_flash/summon.m
#
# Summon fake flash object
#
# @within function hvr:world_manager/phenomenon/overworld/meteor/occur/fake_flash/

# Summon
    data modify storage hvr:api __input__.id set value "world.meteor.fake_flash"
    $execute positioned ~$(x) ~256 ~$(z) run function hvr:api/object/summon