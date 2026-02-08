#> hvr:asset/effect/witch_raider_buff/given/
#
# Given event process
#
# @within function
#   hvr:entity_manager/effect/event/given/dispatch/m

# Add attribute
    attribute @s max_health modifier add hvr:asset/effect/witch_raider_buff.max_health 0.5 add_multiplied_total
    attribute @s armor modifier add hvr:asset/effect/witch_raider_buff.armor 1024 add_value
    attribute @s armor_toughness modifier add hvr:asset/effect/witch_raider_buff.armor_toughness 1024 add_value
    attribute @s attack_damage modifier add hvr:asset/effect/witch_raider_buff.attack_damage 0.2 add_multiplied_total
    attribute @s movement_speed modifier add hvr:asset/effect/witch_raider_buff.movement_speed 0.25 add_multiplied_total