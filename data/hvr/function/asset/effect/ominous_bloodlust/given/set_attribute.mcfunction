#> hvr:asset/effect/ominous_bloodlust/given/set_attribute
#
# Set attribute
#
# @within function
#   hvr:asset/effect/ominous_bloodlust/given

# Remove Old attribute
    attribute @s max_health modifier remove hvr:asset/effect/ominous_bloodlust.max_health
    attribute @s armor modifier remove hvr:asset/effect/ominous_bloodlust.armor
    attribute @s armor_toughness modifier remove hvr:asset/effect/ominous_bloodlust.armor_toughness
    attribute @s attack_damage modifier remove hvr:asset/effect/ominous_bloodlust.attack_damage
    attribute @s movement_speed modifier remove hvr:asset/effect/ominous_bloodlust.movement_speed

# Add attribute
    $attribute @s max_health modifier add hvr:asset/effect/ominous_bloodlust.max_health $(increase) add_multiplied_total
    $attribute @s armor modifier add hvr:asset/effect/ominous_bloodlust.armor $(increase) add_multiplied_total
    $attribute @s armor_toughness modifier add hvr:asset/effect/ominous_bloodlust.armor_toughness $(increase) add_multiplied_total
    $attribute @s attack_damage modifier add hvr:asset/effect/ominous_bloodlust.attack_damage $(increase) add_multiplied_total
    $attribute @s movement_speed modifier add hvr:asset/effect/ominous_bloodlust.movement_speed $(increase) add_multiplied_total