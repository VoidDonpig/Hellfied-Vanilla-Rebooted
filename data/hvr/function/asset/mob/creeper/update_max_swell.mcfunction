#> hvr:asset/mob/creeper/update_max_swell
#
# Update max swell value
#
# @within function hvr:asset/mob/creeper/tick

# Save max swell
    execute store result score @s hvr.mob_asset.creeper.max_swell run data get entity @s Fuse

# Restore Fuse
    data modify entity @s Fuse set value 32767s