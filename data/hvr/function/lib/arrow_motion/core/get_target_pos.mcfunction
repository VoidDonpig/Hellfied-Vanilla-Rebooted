#> hvr:lib/arrow_motion/core/get_target_pos
#
# Get and calc target pos
#
# @within function hvr:lib/arrow_motion/core/exec

# Get pos
    $data modify storage hvr.__temp__:lib __temp__.pos set from entity $(selector) Pos
    data modify storage hvr.__temp__:lib target_pos.x set from storage hvr.__temp__:lib __temp__.pos[0]
    data modify storage hvr.__temp__:lib target_pos.y set from storage hvr.__temp__:lib __temp__.pos[1]
    data modify storage hvr.__temp__:lib target_pos.z set from storage hvr.__temp__:lib __temp__.pos[2]

# Get eye pos
    $execute as $(selector) at @s anchored eyes positioned ^ ^ ^ summon marker run function hvr:lib/arrow_motion/core/get_eye_pos

# Calc target y
    execute store result score $target_pos_y hvr.temporary run data get storage hvr.__temp__:lib target_pos.y 1000
    execute store result score $target_eye_pos hvr.temporary run data get storage hvr.__temp__:lib eye_pos 1000
    scoreboard players add $target_eye_pos hvr.temporary 180
    scoreboard players operation $target_eye_pos hvr.temporary -= $target_pos_y hvr.temporary
    scoreboard players operation $target_eye_pos hvr.temporary /= $3 hvr.constant
    scoreboard players operation $target_pos_y hvr.temporary += $target_eye_pos hvr.temporary
    execute store result storage hvr.__temp__:lib target_pos.y double 0.001 run scoreboard players get $target_pos_y hvr.temporary

# Reset
    scoreboard players reset $target_pos_y hvr.temporary
    scoreboard players reset $target_eye_pos hvr.temporary
    data remove storage hvr.__temp__:lib eye_pos