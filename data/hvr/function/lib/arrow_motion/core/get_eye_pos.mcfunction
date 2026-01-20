#> hvr:lib/arrow_motion/core/get_eye_pos
#
# Get eye pos
#
# @within function hvr:lib/arrow_motion/core/get_target_pos

# Get eye pos
    data modify storage hvr.__temp__:lib eye_pos set from entity @s Pos[1]

# Remove marker
    kill @s