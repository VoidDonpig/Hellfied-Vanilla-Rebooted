#> hvr:asset/mob/enemy.spider/tick/super_leap/motion/
#
# Calc spider motion
#
# @within function hvr:asset/mob/enemy.spider/tick/super_leap/leap_toward_target

# Get horizonal distance
    execute positioned as @n[tag=hvr.target] run function hvr:lib/horizonal_distance/as_to_at
    execute store result score $horizonal_distance hvr.temporary run data get storage hvr:lib __output__.horizonal_distance 1000

# Get distance
    execute positioned as @n[tag=hvr.target] run function hvr:lib/distance/as_to_at
    execute store result score $distance hvr.temporary run data get storage hvr:lib __output__.distance 1000

# Set vector magnitude
    scoreboard players set $vector_magnitude hvr.temporary 6400

# Get spider pos
    execute positioned as @s summon marker run function hvr:asset/mob/enemy.spider/tick/super_leap/motion/get_pos
    data modify storage hvr.__temp__:asset/mob spider_pos set from storage hvr.__temp__:asset/mob __temp__

# Get target pos
    execute positioned as @n[tag=hvr.target] summon marker run function hvr:asset/mob/enemy.spider/tick/super_leap/motion/get_pos
    data modify storage hvr.__temp__:asset/mob target_pos set from storage hvr.__temp__:asset/mob __temp__

# Get d
    execute store result score $dx hvr.temporary run data get storage hvr.__temp__:asset/mob target_pos.x 1000
    execute store result score $dy hvr.temporary run data get storage hvr.__temp__:asset/mob target_pos.y 1000
    execute store result score $dz hvr.temporary run data get storage hvr.__temp__:asset/mob target_pos.z 1000
    execute if entity @n[tag=hvr.target,predicate=hvr:is_on_ground] run scoreboard players add $dy hvr.temporary 1200

    execute store result score $spider_x hvr.temporary run data get storage hvr.__temp__:asset/mob spider_pos.x 1000
    execute store result score $spider_y hvr.temporary run data get storage hvr.__temp__:asset/mob spider_pos.y 1000
    execute store result score $spider_z hvr.temporary run data get storage hvr.__temp__:asset/mob spider_pos.z 1000

    scoreboard players operation $dx hvr.temporary -= $spider_x hvr.temporary
    scoreboard players operation $dy hvr.temporary -= $spider_y hvr.temporary
    scoreboard players operation $dz hvr.temporary -= $spider_z hvr.temporary

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

    scoreboard players set $y_magnitude hvr.temporary 3200
    scoreboard players operation $additional_motion_y hvr.temporary *= $y_magnitude hvr.temporary
    scoreboard players operation $additional_motion_y hvr.temporary *= $y_magnitude hvr.temporary
    scoreboard players operation $additional_motion_y hvr.temporary /= $vector_magnitude hvr.temporary
    scoreboard players operation $additional_motion_y hvr.temporary /= $vector_magnitude hvr.temporary
    
    scoreboard players operation $motion_y hvr.temporary += $additional_motion_y hvr.temporary

    scoreboard players add $motion_y hvr.temporary 800

    scoreboard players operation $motion_z hvr.temporary = $vector_magnitude hvr.temporary
    scoreboard players operation $motion_z hvr.temporary *= $dz hvr.temporary
    scoreboard players operation $motion_z hvr.temporary /= $distance hvr.temporary

# Set motion
    data modify storage hvr.__temp__:asset/mob motion set value [0d,0d,0d]
    execute store result storage hvr.__temp__:asset/mob motion[0] double 0.001 run scoreboard players get $motion_x hvr.temporary
    execute store result storage hvr.__temp__:asset/mob motion[1] double 0.001 run scoreboard players get $motion_y hvr.temporary
    execute store result storage hvr.__temp__:asset/mob motion[2] double 0.001 run scoreboard players get $motion_z hvr.temporary
    data modify entity @s Motion set from storage hvr.__temp__:asset/mob motion

# Reset
    scoreboard players reset $dx hvr.temporary
    scoreboard players reset $dy hvr.temporary
    scoreboard players reset $dz hvr.temporary
    scoreboard players reset $spider_x hvr.temporary
    scoreboard players reset $spider_y hvr.temporary
    scoreboard players reset $spider_z hvr.temporary
    scoreboard players reset $motion_x hvr.temporary
    scoreboard players reset $motion_y hvr.temporary
    scoreboard players reset $motion_z hvr.temporary
    scoreboard players reset $additional_motion_y hvr.temporary
    scoreboard players reset $distance hvr.temporary
    scoreboard players reset $horizonal_distance hvr.temporary
    scoreboard players reset $vector_magnitude hvr.temporary
    scoreboard players reset $y_magnitude hvr.temporary
    data remove storage hvr.__temp__:asset/mob motion
    data remove storage hvr.__temp__:asset/mob spider_pos
    data remove storage hvr.__temp__:asset/mob target_pos
    data remove storage hvr.__temp__:asset/mob __temp__
    data remove storage hvr:lib __output__.distance
    data remove storage hvr:lib __output__.horizonal_distance