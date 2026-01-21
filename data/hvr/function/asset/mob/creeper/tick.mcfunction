#> hvr:asset/mob/creeper/tick
#
# Tick process
#
# @within function hvr:entity_manager/mob/event/tick/dispatch/dispatcher.m

# Update max swell
    execute unless data entity @s {Fuse:32767s} run function hvr:asset/mob/creeper/update_max_swell

# Swell goal
    function hvr:asset/mob/creeper/explode/swell_goal_can_use

# If ignited, set swell_dir 1
    execute if data entity @s {ignited:1b} run scoreboard players set $swell_dir hvr.temporary 1

# Swell
    execute if score $swell_dir hvr.temporary = $swell_dir hvr.temporary unless score $swell_dir hvr.temporary matches 0 run function hvr:asset/mob/creeper/explode/swell