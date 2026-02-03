#> hvr:world_manager/phenomenon/overworld/
#
# Overworld phenomenon tick
#
# @within function hvr:world_manager/phenomenon/

# Meteor
    execute if predicate hvr:time/whole_night unless predicate hvr:weather/is_raining run function hvr:world_manager/phenomenon/overworld/meteor/