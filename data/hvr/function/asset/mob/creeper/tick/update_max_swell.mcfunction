#> hvr:asset/mob/creeper/tick/update_max_swell
#
# Update max swell value
#
# @within function hvr:asset/mob/creeper/tick/

# Save max swell
    execute store result score @s hvr.asset.mob.creeper.max_swell run data get entity @s Fuse

# Restore Fuse
    data modify entity @s Fuse set value 32767s