#> hvr:asset/mob/skeleton/piercing_shot/search
#
# Search owner and add data
#
# @within function hvr:asset/mob/skeleton/tick

# Declare this arrow
    tag @s add hvr.mob_asset.skeleton.arrow_this

# Get owner and compare
    execute on origin if entity @s[tag=hvr.this] as @n[type=arrow,tag=hvr.mob_asset.skeleton.arrow_this] run function hvr:asset/mob/skeleton/piercing_shot/set_data

# Reset
    tag @s remove hvr.mob_asset.skeleton.arrow_this