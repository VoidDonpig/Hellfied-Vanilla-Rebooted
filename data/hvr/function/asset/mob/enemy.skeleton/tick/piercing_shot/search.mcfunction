#> hvr:asset/mob/enemy.skeleton/tick/piercing_shot/search
#
# Search owner and add data
#
# @within function hvr:asset/mob/enemy.skeleton/tick/

# Declare this arrow
    tag @s add hvr.asset.mob.skeleton.arrow_this

# Get owner and compare
    execute on origin if entity @s[type=skeleton,tag=hvr.this] as @n[type=arrow,tag=hvr.asset.mob.skeleton.arrow_this] run function hvr:asset/mob/enemy.skeleton/tick/piercing_shot/set_data

# Reset
    tag @s remove hvr.asset.mob.skeleton.arrow_this