#> hvr:asset/mob/zombie/load
#
# Asset load function
#
# @within function hvr:core/load_once

# Objectives
    scoreboard objectives add hvr.mob_asset.zombie.boost_buff_activate_timer dummy
    scoreboard objectives add hvr.mob_asset.zombie.boost_buff_activating_timer dummy
    scoreboard objectives add hvr.mob_asset.zombie.boost_buff_rebound_refresh_timer dummy