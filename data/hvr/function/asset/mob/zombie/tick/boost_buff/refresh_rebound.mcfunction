#> hvr:asset/mob/zombie/tick/boost_buff/refresh_rebound
#
# Reset rebound debuff
#
# @within function hvr:asset/mob/zombie/tick/boost_buff/increment_refreshing_timer

# Remove attribute
    attribute @s movement_speed modifier remove hvr:asset/mob/zombie.boost_buff_rebound.movement_speed
    attribute @s attack_damage modifier remove hvr:asset/mob/zombie.boost_buff_rebound.attack_damage

# Remove tag
    tag @s remove hvr.mob_asset.zombie.boosting_rebound

# SFX
    execute anchored eyes positioned ^ ^ ^ run particle happy_villager ~ ~ ~ 0.4 0.4 0.4 0 16
    execute anchored eyes positioned ^ ^ ^ run playsound item.armor.equip_leather hostile @a[distance=..16] ~ ~ ~ 1 2

# Reset timer
    scoreboard players reset @s hvr.mob_asset.zombie.boost_buff_rebound_refresh_timer