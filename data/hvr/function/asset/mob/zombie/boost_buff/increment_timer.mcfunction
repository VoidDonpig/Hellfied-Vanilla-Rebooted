#> hvr:asset/mob/zombie/boost_buff/increment_timer
#
# Increment timer and then reset
#
# @within function hvr:asset/mob/warden/tick

# Inncrement timer
    scoreboard players add @s hvr.mob_asset.zombie.boost_buff_activating_timer 1

# SFX
    execute if predicate hvr:interval/4t anchored eyes positioned ^ ^ ^ run particle angry_villager ~ ~ ~

# Reset if reach threshold
    execute if score @s hvr.mob_asset.zombie.boost_buff_activating_timer matches 100.. run function hvr:asset/mob/zombie/boost_buff/reset