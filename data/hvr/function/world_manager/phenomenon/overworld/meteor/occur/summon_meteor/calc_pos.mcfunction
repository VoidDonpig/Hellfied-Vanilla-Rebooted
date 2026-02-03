#> hvr:world_manager/phenomenon/overworld/meteor/occur/summon_meteor/calc_pos
#
# Calculate flash pos
#
# @within function hvr:world_manager/phenomenon/overworld/meteor/occur/summon_meteor/

# Set offset threshold
    scoreboard players set $_ hvr.temporary 100

# Get X offset
    execute store result score $additive_x hvr.temporary run random value 0..65535
    scoreboard players operation $additive_x hvr.temporary %= $_ hvr.temporary
    scoreboard players operation $offset_x hvr.temporary += $additive_x hvr.temporary

    execute store result score $subtractive_x hvr.temporary run random value 0..65535
    scoreboard players operation $subtractive_x hvr.temporary %= $_ hvr.temporary
    scoreboard players operation $offset_x hvr.temporary += $subtractive_x hvr.temporary

# Get Z offset
    execute store result score $additive_z hvr.temporary run random value 0..65535
    scoreboard players operation $additive_z hvr.temporary %= $_ hvr.temporary
    scoreboard players operation $offset_z hvr.temporary -= $additive_z hvr.temporary

    execute store result score $subtractive_z hvr.temporary run random value 0..65535
    scoreboard players operation $subtractive_z hvr.temporary %= $_ hvr.temporary
    scoreboard players operation $offset_z hvr.temporary -= $subtractive_z hvr.temporary

# Get as args
    execute store result storage hvr.__temp__:world_manager args.x int 1 run scoreboard players get $offset_x hvr.temporary
    execute store result storage hvr.__temp__:world_manager args.z int 1 run scoreboard players get $offset_z hvr.temporary

# Reset
    scoreboard players reset $offset_x hvr.temporary
    scoreboard players reset $offset_z hvr.temporary