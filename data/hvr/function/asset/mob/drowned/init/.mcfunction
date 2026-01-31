#> hvr:asset/mob/drowned/init/
#
# Init process
#
# @within function hvr:entity_manager/mob/event/init/dispatch/m

# Remove zombie modifier
    tag @s remove hvr.mob_asset.zombie
    attribute @s movement_speed modifier remove hvr:asset/mob/zombie.spawn_modifier.movement_speed
    execute if entity @s[tag=hvr.mob_asset.zombie.boosting] run function hvr:asset/mob/zombie/tick/boost_buff/reset
    execute if entity @s[tag=hvr.mob_asset.zombie.boosting_rebound] run function hvr:asset/mob/zombie/tick/boost_buff/refresh_rebound

# Equipment
    execute unless data storage hvr:asset/mob {is_newly_converted_mob:true} if score $difficulty hvr.global matches 1 run function hvr:asset/mob/drowned/init/equipment/1

# Increase movement speed
    execute unless entity @s[nbt={IsBaby:1b}] run attribute @s movement_speed modifier add hvr:asset/mob/drowned.spawn_modifier.movement_speed 0.5 add_multiplied_base