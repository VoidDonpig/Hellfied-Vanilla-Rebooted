#> hvr:world_manager/weather/thunderstorm/tick
#
# Tick when thunderstorming
#
# @within function hvr:world_manager/tick

# Lightning
    execute if predicate hvr:chance/0.1 as @r[predicate=hvr:dimension/overworld,limit=10,sort=random] run function hvr:world_manager/weather/summon_lightning/spawn