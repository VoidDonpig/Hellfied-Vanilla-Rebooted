#> hvr:lib/motion/core/non-player/apply
#
# Apply motion
#
# @within function hvr:lib/motion/core/exec

# Get base value
    execute in overworld positioned 0.0 0.0 0.0 run tp 1db9-0-0-0-0 ^ ^ ^1

# Calc
    data modify storage hvr:lib pos set from entity 1db9-0-0-0-0 Pos
    execute store result score $vector_x hvr.temporary run data get storage hvr:lib pos[0] 10000
    execute store result score $vector_y hvr.temporary run data get storage hvr:lib pos[1] 10000
    execute store result score $vector_z hvr.temporary run data get storage hvr:lib pos[2] 10000

    scoreboard players operation $vector_x hvr.temporary *= $vector_magnitude hvr.temporary
    scoreboard players operation $vector_y hvr.temporary *= $vector_magnitude hvr.temporary
    scoreboard players operation $vector_z hvr.temporary *= $vector_magnitude hvr.temporary

# Apply
    execute store result storage hvr:lib pos[0] double 0.000001 run scoreboard players get $vector_x hvr.temporary
    execute store result storage hvr:lib pos[1] double 0.000001 run scoreboard players get $vector_y hvr.temporary
    execute store result storage hvr:lib pos[2] double 0.000001 run scoreboard players get $vector_z hvr.temporary
    data modify entity @s Motion set from storage hvr:lib pos

# Reset
    scoreboard players reset $vector_x hvr.temporary
    scoreboard players reset $vector_y hvr.temporary
    scoreboard players reset $vector_z hvr.temporary
    data remove storage hvr:lib pos