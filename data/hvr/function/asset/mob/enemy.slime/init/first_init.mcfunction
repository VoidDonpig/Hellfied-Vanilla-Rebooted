#> hvr:asset/mob/enemy.slime/init/first_init
#
# First init process
#
# @within function hvr:asset/mob/enemy.slime/init/

# Set size
    data modify entity @s Size set value 4

# Heal
    execute store result entity @s Health float 0.01 run attribute @s max_health get

# Declare this was the first init process of the mob
    tag @s add hvr.asset.mob.enemy.slime_first_init_done