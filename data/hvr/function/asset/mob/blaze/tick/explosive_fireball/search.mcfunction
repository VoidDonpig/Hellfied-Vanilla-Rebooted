#> hvr:asset/mob/blaze/tick/explosive_fireball/search
#
# Search owner and add data
#
# @within function hvr:asset/mob/blaze/tick/

# Declare this fireball
    tag @s add hvr.asset.mob.blaze.fireball_this

# Get owner and compare
    execute on origin if entity @s[type=blaze,tag=hvr.this] as @n[type=small_fireball,tag=hvr.asset.mob.blaze.fireball_this] run function hvr:asset/mob/blaze/tick/explosive_fireball/set_data

# Reset
    tag @s remove hvr.asset.mob.blaze.fireball_this