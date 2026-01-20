#> hvr:entity_manager/player/event/hurt/on_hurt_by_mob
#
# Event handler when mob attack player
#
# @within advancement hvr:entity_manager/player/entity_hurt_player

# Filter
    function hvr:entity_manager/player/event/hurt/filter/start

# Revoke advancement
    advancement revoke @s only hvr:entity_manager/player/entity_hurt_player