#> hvr:world_manager/phenomenon/overworld/meteor/occur/fake_flash/
#
# Flash
#
# @within function hvr:world_manager/phenomenon/overworld/meteor/occur/

# Calc flash pos
    function hvr:world_manager/phenomenon/overworld/meteor/occur/fake_flash/calc_pos

# Summon flash object
    execute at @r[predicate=hvr:can_see_sky,predicate=hvr:dimension/overworld] run function hvr:world_manager/phenomenon/overworld/meteor/occur/fake_flash/summon.m with storage hvr.__temp__:world_manager args

# Reset
    data remove storage hvr.__temp__:world_manager args
