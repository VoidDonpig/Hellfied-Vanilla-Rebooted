#> hvr:world_manager/phenomenon/overworld/meteor/occur/summon_meteor/
#
# Flash
#
# @within function hvr:world_manager/phenomenon/overworld/meteor/occur/

# Calc meteor pos
    function hvr:world_manager/phenomenon/overworld/meteor/occur/summon_meteor/calc_pos

# Summon meteor
    execute as @r[predicate=hvr:can_see_sky,predicate=hvr:dimension/overworld] at @s run function hvr:world_manager/phenomenon/overworld/meteor/occur/summon_meteor/summon.m with storage hvr.__temp__:world_manager args

# Reset
    data remove storage hvr.__temp__:world_manager args
