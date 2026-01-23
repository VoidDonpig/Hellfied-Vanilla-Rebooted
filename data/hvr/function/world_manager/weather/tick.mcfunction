#> hvr:world_manager/weather/tick
#
# Weather tick
#
# @within function hvr:world_manager/tick

# Weather manager
    execute if predicate hvr:weather/is_raining run function hvr:world_manager/weather/rain/tick
    execute if predicate hvr:weather/is_lightning run function hvr:world_manager/weather/thunderstorm/tick