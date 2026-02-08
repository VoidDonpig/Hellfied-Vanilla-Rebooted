#> hvr:asset/mob/enemy.slime/init/first_init
#
# First init process
#
# @within function hvr:asset/mob/enemy.slime/init/

# Set size
    data modify entity @s Size set value 4

# Declare this was the first init process of the mob
    tag @s add hvr.asset.mob.enemy.slime_first_init_done