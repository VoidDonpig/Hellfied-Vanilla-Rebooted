#> hvr:asset/mob/enemy.magma_cube/init/first_init
#
# First init process
#
# @within function hvr:asset/mob/enemy.magma_cube/init/

# Set size
    data modify entity @s Size set value 6

# Set Health
    attribute @s max_health base set 36
    execute store result entity @s Health float 0.01 run attribute @s max_health get

# Declare this was the first init process of the mob
    tag @s add hvr.asset.mob.enemy.magma_cube_first_init_done