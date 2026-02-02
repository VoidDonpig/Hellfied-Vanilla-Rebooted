#> hvr:asset/mob/enemy.zombie/tick/boost_buff/increment_refreshing_timer
#
# Increment refreshing timer
#
# @within function hvr:asset/mob/enemy.warden/tick

# Increment timer
    scoreboard players add @s hvr.asset.mob.zombie.boost_buff_rebound_refresh_timer 1

# Reset rebound
    execute if score @s hvr.asset.mob.zombie.boost_buff_rebound_refresh_timer matches 60.. run function hvr:asset/mob/enemy.zombie/tick/boost_buff/refresh_rebound