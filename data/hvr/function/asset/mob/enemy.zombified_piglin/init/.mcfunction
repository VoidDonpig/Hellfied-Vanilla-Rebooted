#> hvr:asset/mob/enemy.zombified_piglin/init/
#
# Init process
#
# @within function hvr:entity_manager/mob/event/init/dispatch/m

# Increase movement speed
    execute unless entity @s[nbt={IsBaby:1b}] run attribute @s movement_speed modifier add hvr:asset/mob/zombified_piglin.spawn_modifier.movement_speed 0.5 add_multiplied_base