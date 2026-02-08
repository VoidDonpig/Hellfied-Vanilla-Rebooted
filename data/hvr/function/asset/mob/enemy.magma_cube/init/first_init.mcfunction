#> hvr:asset/mob/enemy.magma_cube/init/first_init
#
# First init process
#
# @within function hvr:asset/mob/enemy.magma_cube/init/

# Set size
    data modify entity @s Size set value 6

# Declare this was the first init process of the mob
    tag @s add hvr.asset.mob.enemy.magma_cube_first_init_done