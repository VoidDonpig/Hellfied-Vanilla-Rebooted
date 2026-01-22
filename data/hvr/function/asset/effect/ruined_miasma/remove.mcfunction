#> hvr:asset/effect/ruined_miasma/remove
#
# Remove event process
#
# @within
#   function hvr:entity_manager/effect/event/remove/dispatch/dispatcher.m
#   hvr:asset/effect/ruined_miasma/end

# Remove attribute
    attribute @s max_health modifier remove ruined_miasma.max_health
    attribute @s armor modifier remove ruined_miasma.armor
    attribute @s armor_toughness modifier remove ruined_miasma.armor_toughness
    attribute @s attack_damage modifier remove ruined_miasma.attack_damage
    attribute @s movement_speed modifier remove ruined_miasma.movement_speed