#> hvr:world/weather/rain/lightning/random_location/random
#
# Random location
#
# @within function hvr:world/weather/rain/lightning/random_location/choose

# Get pos
    execute store result score $pos_x hvr.temporary run data get storage hvr:api Pos[0]
    execute store result score $pos_z hvr.temporary run data get storage hvr:api Pos[2]

# Bounds
    execute store result score $additive_x hvr.temporary run random value -128..128
    execute store result score $additive_z hvr.temporary run random value -128..128

    scoreboard players operation $pos_x hvr.temporary += $additive_x hvr.temporary
    scoreboard players operation $pos_z hvr.temporary += $additive_z hvr.temporary

# Tp
    data modify storage hvr.__temp__:world modified_pos set value [0d,0d,0d]
    execute store result storage hvr.__temp__:world modified_pos[0] double 1 run scoreboard players get $pos_x hvr.temporary
    execute store result storage hvr.__temp__:world modified_pos[2] double 1 run scoreboard players get $pos_z hvr.temporary
    data modify entity @s Pos set from storage hvr.__temp__:world modified_pos

# Reset
    data remove storage hvr.__temp__:world modified_pos
    scoreboard players reset $pos_x hvr.temporary
    scoreboard players reset $pos_z hvr.temporary
    scoreboard players reset $additive_x hvr.temporary
    scoreboard players reset $additive_z hvr.temporary