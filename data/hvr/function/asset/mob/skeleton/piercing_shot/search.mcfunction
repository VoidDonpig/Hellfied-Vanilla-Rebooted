#> hvr:asset/mob/skeleton/piercing_shot/search
#
# Search owner and add data
#
# @within function hvr:asset/mob/skeleton/tick

# Declare self arrow
    tag @s add hvr.mob_asset.skeleton.arrow_self

# Get owner and compare
    execute on origin if entity @s[type=skeleton,tag=hvr.self] as @n[type=arrow,tag=hvr.mob_asset.skeleton.arrow_self] run function hvr:asset/mob/skeleton/piercing_shot/set_data

# Reset
    tag @s remove hvr.mob_asset.skeleton.arrow_self