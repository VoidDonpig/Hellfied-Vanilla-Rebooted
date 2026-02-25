#> hvr:core/tick/world/pre
#
# World pre tick
#
# @within function hvr:core/tick/main

# Get difficulty difference
    execute store result score $current_difficulty hvr.temporary run difficulty
    # Change difficulty
        execute unless score $current_difficulty hvr.temporary = $previous_refered_difficulty hvr.world run function hvr:world_manager/difficulty/
    # Store current one
        scoreboard players operation $previous_refered_difficulty hvr.world = $current_difficulty hvr.temporary
    # Reset
        scoreboard players reset $current_difficulty hvr.temporary