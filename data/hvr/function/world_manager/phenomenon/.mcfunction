#> hvr:world_manager/phenomenon/
#
# Phenomenon tick
#
# @within function hvr:core/tick/world/

# Overworld
    execute if entity @p[predicate=hvr:dimension/overworld] run function hvr:world_manager/phenomenon/overworld/tick
    