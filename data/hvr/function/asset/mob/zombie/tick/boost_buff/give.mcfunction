#> hvr:asset/mob/zombie/tick/boost_buff/give
#
# Boost buff function
#
# @within function hvr:asset/mob/zombie/in_hostile

# Increase attribute
    attribute @s movement_speed modifier add hvr:asset/mob/zombie.boost_buff.movement_speed 0.2 add_multiplied_total
    attribute @s attack_damage modifier add hvr:asset/mob/zombie.boost_buff.attack_damage 3 add_value

# Give tag
    tag @s add hvr.mob_asset.zombie.boosting

# SFX
    execute anchored eyes positioned ^ ^ ^ run particle trial_spawner_detection ~ ~ ~ 0.4 0.4 0.4 0 16
    execute anchored eyes positioned ^ ^ ^ run playsound entity.ender_dragon.growl hostile @a[distance=..16] ~ ~ ~ 1 2

# Reset timer
    scoreboard players reset @s hvr.mob_asset.zombie.boost_buff_activate_timer