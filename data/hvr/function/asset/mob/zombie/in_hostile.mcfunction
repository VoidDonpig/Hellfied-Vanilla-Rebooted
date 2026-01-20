#> hvr:asset/mob/zombie/in_hostile
#
# In hostile tick
#
# @within function hvr:asset/mob/warden/tick

# Boost
    # Add timer
        execute if entity @s[tag=!hvr.mob_asset.zombie.boosting,tag=!hvr.mob_asset.zombie.boosting_rebound] run scoreboard players add @s hvr.mob_asset.zombie.boost_buff_activate_timer 1
    # run
        execute if score @s hvr.mob_asset.zombie.boost_buff_activate_timer matches 200.. run function hvr:asset/mob/zombie/boost_buff/give