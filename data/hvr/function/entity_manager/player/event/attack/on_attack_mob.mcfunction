#> hvr:entity_manager/player/event/attack/on_attack_mob
#
# Event handler when player attack mob
#
# @within advancement hvr:entity_manager/player/player_hurt_entity

# Filter
    function hvr:entity_manager/player/event/attack/filter/start

# Revoke advancement
    advancement revoke @s only hvr:entity_manager/player/player_hurt_entity