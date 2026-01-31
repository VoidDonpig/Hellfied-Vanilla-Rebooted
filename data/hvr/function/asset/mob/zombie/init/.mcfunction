#> hvr:asset/mob/zombie/init/
#
# Init process
#
# @within function hvr:entity_manager/mob/event/init/dispatch/m

# Remove husk modifier
    tag @s remove hvr.mob_asset.husk
    attribute @s movement_speed modifier remove hvr:asset/mob/husk.spawn_modifier.movement_speed

# Equipment
    execute unless data storage hvr:asset/mob {is_newly_converted_mob:true} if score $difficulty hvr.global matches 1 run function hvr:asset/mob/zombie/equipment/1

# Increase movement speed
    execute unless entity @s[nbt={IsBaby:1b}] run attribute @s movement_speed modifier add hvr:asset/mob/zombie.spawn_modifier.movement_speed 0.5 add_multiplied_base

# Enable pick up loot
    data modify entity @s CanPickUpLoot set value true