#> hvr:world_manager/weather/lightning/random_location/check
#
# Check if summon
#
# @within function hvr:world_manager/weather/lightning/random_location/choose

# Check
    execute unless block ~ ~ ~ air run return fail
    execute if block ~ ~-1 ~ air run return fail

# End loop
    scoreboard players set $loop_count hvr.temporary 64

# Success
    return 1