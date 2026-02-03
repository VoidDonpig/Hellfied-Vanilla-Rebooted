#> hvr:world_manager/phenomenon/overworld/meteor/draw
#
# Draw and occur
#
# @within function hvr:world_manager/phenomenon/overworld/meteor/

# Get random value
    execute store result score $ hvr.temporary run random value 0..65535
    scoreboard players set $_ hvr.temporary 9999
    scoreboard players operation $ hvr.temporary %= $_ hvr.temporary

# Cause? (0.01%)
    execute if score $_ hvr.temporary matches 1..9999 run return fail

# Fake or Real? (1% for Real)
    scoreboard players set $is_real hvr.temporary 0
    execute if score $_ hvr.temporary matches 0..99 run scoreboard players set $is_real hvr.temporary 1

# Cause meteor phenomenon
    function hvr:world_manager/phenomenon/overworld/meteor/occur/

# Reset
    scoreboard players reset $is_real hvr.temporary