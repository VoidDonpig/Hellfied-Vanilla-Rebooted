#> hvr:asset/mob/zombie/tick/boost_buff/give_rebound_debuff
#
# Rebound effect
#
# @within function hvr:asset/mob/zombie/tick/boost_buff/reset

# Give rebound effect
    attribute @s movement_speed modifier add hvr:asset/mob/zombie.boost_buff_rebound.movement_speed -0.4 add_multiplied_total
    attribute @s attack_damage modifier add hvr:asset/mob/zombie.boost_buff_rebound.attack_damage -6 add_value

# Add tag
    tag @s add hvr.mob_asset.zombie.boosting_rebound