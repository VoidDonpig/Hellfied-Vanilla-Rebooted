#> hvr:asset/mob/enemy.creeper/init/
#
# Init process
#
# @within function hvr:entity_manager/mob/event/init/dispatch/m

# Set swell 0
    scoreboard players set @s hvr.asset.mob.creeper.swell 0

# Save max swell
    execute store result score @s hvr.asset.mob.creeper.max_swell run data get entity @s Fuse

# Prevent vanilla explosion
    data modify entity @s Fuse set value 32767s