#> hvr:world_manager/difficulty/multiplayers_calc
#
# Multiplayers calculaton
#
# @within function hvr:world_manager/difficulty/

#> Private
# @private
#declare score_holder $player_count_difficulty

# Calc
    scoreboard players set $player_count_difficulty hvr.temporary 3
    scoreboard players operation $player_count_difficulty hvr.temporary *= $player_count hvr.temporary
    
# Add
    scoreboard players operation $difficulty hvr.world += $player_count_difficulty hvr.temporary

# Reset
    scoreboard players reset $player_count_difficulty hvr.temporary