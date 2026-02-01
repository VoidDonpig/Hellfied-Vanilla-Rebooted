#> hvr:world_manager/weather/thunderstorm/
#
# Tick when thunderstorming
#
# @within function hvr:core/tick/world/

# Lightning
    execute if predicate hvr:chance/0.1 as @r[predicate=hvr:dimension/overworld,limit=10,sort=random] run function hvr:world_manager/weather/lightning/spawn