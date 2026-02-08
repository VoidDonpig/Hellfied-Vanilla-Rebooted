#> hvr:asset/mob/enemy.witch/init/
#
# Init Event
#
# @within function hvr:entity_manager/mob/event/init/dispatch/m

# Raid mob initialization
    execute if entity @s[predicate=hvr:has_raid] run function hvr:asset/mob/enemy.witch/init/raid_init