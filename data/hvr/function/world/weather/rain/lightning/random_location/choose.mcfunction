#> hvr:world/weather/rain/lightning/random_location/choose
#
# Choose location and summon marker
#
# @within function hvr:world/weather/rain/lightning/spawn

# Random location
    function hvr:world/weather/rain/lightning/random_location/random

# Check location and summon
    execute at @s positioned over world_surface if function hvr:world/weather/rain/lightning/random_location/check run summon lightning_bolt

# Add counter
    scoreboard players add $loop_count hvr.temporary 1

# Repeat if succeeded summon or 64 looped
    execute unless score $loop_count hvr.temporary matches 64.. run function hvr:world/weather/rain/lightning/random_location/choose

# Kill marker
    kill @s