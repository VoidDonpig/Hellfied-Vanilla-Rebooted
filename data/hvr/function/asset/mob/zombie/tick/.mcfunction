#> hvr:asset/mob/zombie/tick/
#
# Tick process
#
# @within function hvr:entity_manager/mob/event/tick/dispatch/m

# Reset when not hostile
    execute unless predicate hvr:in_hostile run function hvr:asset/mob/zombie/reset/

# Rebound timer
    execute if entity @s[tag=hvr.mob_asset.zombie.boosting_rebound] run function hvr:asset/mob/zombie/tick/boost_buff/increment_refreshing_timer

# Boost timer
    execute if entity @s[tag=hvr.mob_asset.zombie.boosting] run function hvr:asset/mob/zombie/tick/boost_buff/increment_timer

# Hostile action
    execute if predicate hvr:in_hostile run function hvr:asset/mob/zombie/tick/in_hostile