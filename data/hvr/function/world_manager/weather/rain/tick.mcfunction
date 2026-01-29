#> hvr:world_manager/weather/rain/tick
#
# Tick when raining
#
# @within function hvr:world_manager/tick

# Lightning
    execute if predicate hvr:chance/0.01 as @r[predicate=hvr:dimension/overworld,limit=2,sort=random] run function hvr:world_manager/weather/summon_lightning/spawn