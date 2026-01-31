#> hvr:lib/arrow_motion/core/
#
# Calculation motion values
#
# @within function hvr:lib/arrow_motion/

# Get horizonal distance
    $execute positioned as $(selector) run function hvr:lib/horizonal_distance/as_to_at
    execute store result score $horizonal_distance hvr.temporary run data get storage hvr:lib __output__.horizonal_distance 1000

# Get distance
    $execute positioned as $(selector) run function hvr:lib/distance/as_to_at
    execute store result score $distance hvr.temporary run data get storage hvr:lib __output__.distance 1000

# Get vector magnitude
    execute store result score $vector_magnitude hvr.temporary run data get storage hvr:lib __input__.vector_magnitude 1000

# Get arrow pos
    execute positioned as @s summon marker run function hvr:lib/arrow_motion/core/get_pos
    data modify storage hvr.__temp__:lib arrow_pos set from storage hvr.__temp__:lib __temp__

# Get target pos
    function hvr:lib/arrow_motion/core/get_target_pos with storage hvr:lib __input__

# Get d
    execute store result score $dx hvr.temporary run data get storage hvr.__temp__:lib target_pos.x 1000
    execute store result score $dy hvr.temporary run data get storage hvr.__temp__:lib target_pos.y 1000
    execute store result score $dz hvr.temporary run data get storage hvr.__temp__:lib target_pos.z 1000

    execute store result score $arrow_x hvr.temporary run data get storage hvr.__temp__:lib arrow_pos.x 1000
    execute store result score $arrow_y hvr.temporary run data get storage hvr.__temp__:lib arrow_pos.y 1000
    execute store result score $arrow_z hvr.temporary run data get storage hvr.__temp__:lib arrow_pos.z 1000

    scoreboard players operation $dx hvr.temporary -= $arrow_x hvr.temporary
    scoreboard players operation $dy hvr.temporary -= $arrow_y hvr.temporary
    scoreboard players operation $dz hvr.temporary -= $arrow_z hvr.temporary

# Calc motion
    scoreboard players operation $motion_x hvr.temporary = $vector_magnitude hvr.temporary
    scoreboard players operation $motion_x hvr.temporary *= $dx hvr.temporary
    scoreboard players operation $motion_x hvr.temporary /= $distance hvr.temporary

    scoreboard players operation $motion_y hvr.temporary = $vector_magnitude hvr.temporary
    scoreboard players operation $motion_y hvr.temporary *= $dy hvr.temporary
    scoreboard players operation $motion_y hvr.temporary /= $distance hvr.temporary

    scoreboard players operation $additional_motion_y hvr.temporary = $vector_magnitude hvr.temporary
    scoreboard players operation $additional_motion_y hvr.temporary *= $2 hvr.constant
    scoreboard players operation $additional_motion_y hvr.temporary *= $horizonal_distance hvr.temporary
    scoreboard players operation $additional_motion_y hvr.temporary /= $distance hvr.temporary
    scoreboard players operation $additional_motion_y hvr.temporary /= $10 hvr.constant

    scoreboard players operation $additional_motion_y hvr.temporary *= $1600 hvr.constant
    scoreboard players operation $additional_motion_y hvr.temporary *= $1600 hvr.constant
    scoreboard players operation $additional_motion_y hvr.temporary /= $vector_magnitude hvr.temporary
    scoreboard players operation $additional_motion_y hvr.temporary /= $vector_magnitude hvr.temporary
    

    scoreboard players operation $motion_y hvr.temporary += $additional_motion_y hvr.temporary

    scoreboard players operation $motion_z hvr.temporary = $vector_magnitude hvr.temporary
    scoreboard players operation $motion_z hvr.temporary *= $dz hvr.temporary
    scoreboard players operation $motion_z hvr.temporary /= $distance hvr.temporary

# Set motion
    data modify storage hvr.__temp__:lib motion set value [0d,0d,0d]
    execute store result storage hvr.__temp__:lib motion[0] double 0.001 run scoreboard players get $motion_x hvr.temporary
    execute store result storage hvr.__temp__:lib motion[1] double 0.001 run scoreboard players get $motion_y hvr.temporary
    execute store result storage hvr.__temp__:lib motion[2] double 0.001 run scoreboard players get $motion_z hvr.temporary
    data modify entity @s Motion set from storage hvr.__temp__:lib motion

# Reset
    scoreboard players reset $dx hvr.temporary
    scoreboard players reset $dy hvr.temporary
    scoreboard players reset $dz hvr.temporary
    scoreboard players reset $arrow_x hvr.temporary
    scoreboard players reset $arrow_y hvr.temporary
    scoreboard players reset $arrow_z hvr.temporary
    scoreboard players reset $motion_x hvr.temporary
    scoreboard players reset $motion_y hvr.temporary
    scoreboard players reset $motion_z hvr.temporary
    scoreboard players reset $additional_motion_y hvr.temporary
    scoreboard players reset $distance hvr.temporary
    scoreboard players reset $horizonal_distance hvr.temporary
    scoreboard players reset $vector_magnitude hvr.temporary
    data remove storage hvr.__temp__:lib motion
    data remove storage hvr.__temp__:lib arrow_pos
    data remove storage hvr.__temp__:lib target_pos
    data remove storage hvr.__temp__:lib __temp__
    data remove storage hvr:lib __output__.distance
    data remove storage hvr:lib __output__.horizonal_distance