#> hvr:asset/mob/enemy.zombie/load
#
# Asset load function
#
# @within function hvr:core/load/once

# Objectives
    scoreboard objectives add hvr.asset.mob.zombie.boost_buff_activate_timer dummy
    scoreboard objectives add hvr.asset.mob.zombie.boost_buff_activating_timer dummy
    scoreboard objectives add hvr.asset.mob.zombie.boost_buff_rebound_refresh_timer dummy