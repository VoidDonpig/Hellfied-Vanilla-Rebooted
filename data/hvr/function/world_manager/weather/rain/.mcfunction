#> hvr:world_manager/weather/rain/
#
# Tick when raining
#
# @within function hvr:core/tick/world/

# Lightning
    execute if predicate hvr:chance/0.01 as @r[predicate=hvr:dimension/overworld,limit=2,sort=random] run function hvr:world_manager/weather/lightning/spawn