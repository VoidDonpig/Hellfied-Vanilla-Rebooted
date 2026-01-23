#> hvr:world/weather/rain/tick
#
# Tick when raining
#
# @within function hvr:world/tick

# Lightning
    execute if predicate hvr:chance/0.01 as @r[predicate=hvr:dimension/overworld,limit=2,sort=random] run function hvr:world/weather/rain/lightning/spawn