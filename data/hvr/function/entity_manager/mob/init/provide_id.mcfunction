#> hvr:entity_manager/mob/provide_id
#
# Provide id and bit tag to mob
#
# @within function hvr:entity_manager/mob/init/common

# Add global index
    scoreboard players add $mob_id_index hvr.global 1
    scoreboard players operation $mob_id_index hvr.global %= $2^15 hvr.constant
    execute if score $mob_id_index hvr.global matches 0 run scoreboard players add $mob_id_index hvr.global 1

# Set as id
    scoreboard players operation @s hvr.mob_id = $mob_id_index hvr.global

# Clone
    scoreboard players operation $clone_mob_id_index hvr.temporary = $mob_id_index hvr.global

# FlagIndex << 16
    scoreboard players operation $clone_mob_id_index hvr.temporary *= $2^16 hvr.constant

# Remove old tag
    tag @s remove hvr.mob_id_bit_0.0
    tag @s remove hvr.mob_id_bit_0.1
    tag @s remove hvr.mob_id_bit_1.0
    tag @s remove hvr.mob_id_bit_1.1
    tag @s remove hvr.mob_id_bit_2.0
    tag @s remove hvr.mob_id_bit_2.1
    tag @s remove hvr.mob_id_bit_3.0
    tag @s remove hvr.mob_id_bit_3.1
    tag @s remove hvr.mob_id_bit_4.0
    tag @s remove hvr.mob_id_bit_4.1
    tag @s remove hvr.mob_id_bit_5.0
    tag @s remove hvr.mob_id_bit_5.1
    tag @s remove hvr.mob_id_bit_6.0
    tag @s remove hvr.mob_id_bit_6.1
    tag @s remove hvr.mob_id_bit_7.0
    tag @s remove hvr.mob_id_bit_7.1
    tag @s remove hvr.mob_id_bit_8.0
    tag @s remove hvr.mob_id_bit_8.1
    tag @s remove hvr.mob_id_bit_9.0
    tag @s remove hvr.mob_id_bit_9.1
    tag @s remove hvr.mob_id_bit_10.0
    tag @s remove hvr.mob_id_bit_10.1
    tag @s remove hvr.mob_id_bit_11.0
    tag @s remove hvr.mob_id_bit_11.1
    tag @s remove hvr.mob_id_bit_12.0
    tag @s remove hvr.mob_id_bit_12.1
    tag @s remove hvr.mob_id_bit_13.0
    tag @s remove hvr.mob_id_bit_13.1
    tag @s remove hvr.mob_id_bit_14.0
    tag @s remove hvr.mob_id_bit_14.1
    tag @s remove hvr.mob_id_bit_15.0
    tag @s remove hvr.mob_id_bit_15.1

# Add header tag
    execute if score $clone_mob_id_index hvr.temporary matches 0.. run tag @s add hvr.mob_id_bit_0.0
    execute if score $clone_mob_id_index hvr.temporary matches ..-1 run tag @s add hvr.mob_id_bit_0.1

# Give other bit tags
    scoreboard players operation $clone_mob_id_index hvr.temporary *= $2 hvr.constant
    execute if score $clone_mob_id_index hvr.temporary matches 0.. run tag @s add hvr.mob_id_bit_1.0
    execute if score $clone_mob_id_index hvr.temporary matches ..-1 run tag @s add hvr.mob_id_bit_1.1
    scoreboard players operation $clone_mob_id_index hvr.temporary *= $2 hvr.constant
    execute if score $clone_mob_id_index hvr.temporary matches 0.. run tag @s add hvr.mob_id_bit_2.0
    execute if score $clone_mob_id_index hvr.temporary matches ..-1 run tag @s add hvr.mob_id_bit_2.1
    scoreboard players operation $clone_mob_id_index hvr.temporary *= $2 hvr.constant
    execute if score $clone_mob_id_index hvr.temporary matches 0.. run tag @s add hvr.mob_id_bit_3.0
    execute if score $clone_mob_id_index hvr.temporary matches ..-1 run tag @s add hvr.mob_id_bit_3.1
    scoreboard players operation $clone_mob_id_index hvr.temporary *= $2 hvr.constant
    execute if score $clone_mob_id_index hvr.temporary matches 0.. run tag @s add hvr.mob_id_bit_4.0
    execute if score $clone_mob_id_index hvr.temporary matches ..-1 run tag @s add hvr.mob_id_bit_4.1
    scoreboard players operation $clone_mob_id_index hvr.temporary *= $2 hvr.constant
    execute if score $clone_mob_id_index hvr.temporary matches 0.. run tag @s add hvr.mob_id_bit_5.0
    execute if score $clone_mob_id_index hvr.temporary matches ..-1 run tag @s add hvr.mob_id_bit_5.1
    scoreboard players operation $clone_mob_id_index hvr.temporary *= $2 hvr.constant
    execute if score $clone_mob_id_index hvr.temporary matches 0.. run tag @s add hvr.mob_id_bit_6.0
    execute if score $clone_mob_id_index hvr.temporary matches ..-1 run tag @s add hvr.mob_id_bit_6.1
    scoreboard players operation $clone_mob_id_index hvr.temporary *= $2 hvr.constant
    execute if score $clone_mob_id_index hvr.temporary matches 0.. run tag @s add hvr.mob_id_bit_7.0
    execute if score $clone_mob_id_index hvr.temporary matches ..-1 run tag @s add hvr.mob_id_bit_7.1
    scoreboard players operation $clone_mob_id_index hvr.temporary *= $2 hvr.constant
    execute if score $clone_mob_id_index hvr.temporary matches 0.. run tag @s add hvr.mob_id_bit_8.0
    execute if score $clone_mob_id_index hvr.temporary matches ..-1 run tag @s add hvr.mob_id_bit_8.1
    scoreboard players operation $clone_mob_id_index hvr.temporary *= $2 hvr.constant
    execute if score $clone_mob_id_index hvr.temporary matches 0.. run tag @s add hvr.mob_id_bit_9.0
    execute if score $clone_mob_id_index hvr.temporary matches ..-1 run tag @s add hvr.mob_id_bit_9.1
    scoreboard players operation $clone_mob_id_index hvr.temporary *= $2 hvr.constant
    execute if score $clone_mob_id_index hvr.temporary matches 0.. run tag @s add hvr.mob_id_bit_10.0
    execute if score $clone_mob_id_index hvr.temporary matches ..-1 run tag @s add hvr.mob_id_bit_10.1
    scoreboard players operation $clone_mob_id_index hvr.temporary *= $2 hvr.constant
    execute if score $clone_mob_id_index hvr.temporary matches 0.. run tag @s add hvr.mob_id_bit_11.0
    execute if score $clone_mob_id_index hvr.temporary matches ..-1 run tag @s add hvr.mob_id_bit_11.1
    scoreboard players operation $clone_mob_id_index hvr.temporary *= $2 hvr.constant
    execute if score $clone_mob_id_index hvr.temporary matches 0.. run tag @s add hvr.mob_id_bit_12.0
    execute if score $clone_mob_id_index hvr.temporary matches ..-1 run tag @s add hvr.mob_id_bit_12.1
    scoreboard players operation $clone_mob_id_index hvr.temporary *= $2 hvr.constant
    execute if score $clone_mob_id_index hvr.temporary matches 0.. run tag @s add hvr.mob_id_bit_13.0
    execute if score $clone_mob_id_index hvr.temporary matches ..-1 run tag @s add hvr.mob_id_bit_13.1
    scoreboard players operation $clone_mob_id_index hvr.temporary *= $2 hvr.constant
    execute if score $clone_mob_id_index hvr.temporary matches 0.. run tag @s add hvr.mob_id_bit_14.0
    execute if score $clone_mob_id_index hvr.temporary matches ..-1 run tag @s add hvr.mob_id_bit_14.1
    scoreboard players operation $clone_mob_id_index hvr.temporary *= $2 hvr.constant
    execute if score $clone_mob_id_index hvr.temporary matches 0.. run tag @s add hvr.mob_id_bit_15.0
    execute if score $clone_mob_id_index hvr.temporary matches ..-1 run tag @s add hvr.mob_id_bit_15.1

# Reset
    scoreboard players reset $clone_mob_id_index hvr.temporary