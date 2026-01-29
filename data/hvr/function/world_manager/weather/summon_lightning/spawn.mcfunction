#> hvr:world_manager/weather/summon_lightning/spawn
#
# Randamly spawn lightning
#
# @within function
#   hvr:world_manager/weather/rain/tick
#   hvr:world_manager/weather/thunderstorm/tick

# Get location
    function hvr:api/get_data/pos

# Random location
    execute in overworld summon marker run function hvr:world_manager/weather/summon_lightning/random_location/choose

# Reset
    scoreboard players reset $loop_count hvr.temporary
    data remove storage hvr:api Pos