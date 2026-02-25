#> hvr:world_manager/difficulty/
#
# Difficulty Manager
#
# @within function hvr:world_manager/difficulty/event/**

#> Private
# @private
#declare score_holder $vanilla_difficulty
#declare score_holder $progression_difficulty

#> Player count
# @within function
#   hvr:world_manager/difficulty/
#   hvr:world_manager/difficulty/multiplayers_calc
#declare score_holder $player_count

# Reset current difficulty
    scoreboard players set $difficulty hvr.world 0

# Add vanilla difficulty level
    execute store result score $vanilla_difficulty hvr.temporary run difficulty
    # If peaceful, end process
        execute if score $vanilla_difficulty hvr.temporary matches 0 run return run scoreboard players reset $vanilla_difficulty hvr.temporary
    # Multiplicate the value 10 times
        scoreboard players operation $vanilla_difficulty hvr.temporary *= $10 hvr.constant
    # Add
        scoreboard players operation $difficulty hvr.world += $vanilla_difficulty hvr.temporary

# Progression difficulty
    # Get progression
        # Enter the nether
            execute if data storage hvr:world_manager event.enter_the_nether{achieved:true} run scoreboard players set $progression_difficulty hvr.temporary 10
        # Get eye of ender
            execute if data storage hvr:world_manager event.get_ender_eye{achieved:true} run scoreboard players set $progression_difficulty hvr.temporary 20
        # Defeat ender dragon
            execute if data storage hvr:world_manager event.defeat_ender_dragon{achieved:true} run scoreboard players set $progression_difficulty hvr.temporary 40
        # Enter end gateway
            execute if data storage hvr:world_manager event.enter_end_gateway{achieved:true} run scoreboard players set $progression_difficulty hvr.temporary 45
        # Get elytra
            execute if data storage hvr:world_manager event.get_elytra{achieved:true} run scoreboard players set $progression_difficulty hvr.temporary 60
    # Add
        scoreboard players operation $difficulty hvr.world += $progression_difficulty hvr.temporary

# Player numbers
    # Get current number of players (max 10)
        execute as @a[tag=!hvr.player_may_exception,limit=10] run scoreboard players add $player_count hvr.temporary 1
    # Calc
        execute if score $player_count hvr.temporary matches 2.. run function hvr:world_manager/difficulty/multiplayers_calc

# Clump < 90
    scoreboard players set $ hvr.temporary 90
    scoreboard players operation $difficulty hvr.world < $ hvr.temporary
    scoreboard players reset $ hvr.temporary

# If wither exists, force add 10 difficulty points
    execute if entity @n[type=wither] run scoreboard players add $difficulty hvr.world 10

# Reset
    scoreboard players reset $vanilla_difficulty hvr.temporary
    scoreboard players reset $progression_difficulty hvr.temporary
    scoreboard players reset $player_count hvr.temporary