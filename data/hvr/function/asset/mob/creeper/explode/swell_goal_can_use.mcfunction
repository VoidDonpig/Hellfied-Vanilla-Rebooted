#> hvr:asset/mob/creeper/explode/swell_goal_can_use
#
# Check if Swell goal can be used
#
# @within function hvr:asset/mob/creeper/tick

# SwellDir > 0?
    execute if score @s hvr.mob_asset.creeper.swell matches 1.. run return run function hvr:asset/mob/creeper/explode/swell_goal

# target != null?
    execute unless entity @n[type=#hvr:living,tag=hvr.target] run return fail

# distance < 3?
    execute unless entity @n[type=#hvr:living,tag=hvr.target,distance=3..] run function hvr:asset/mob/creeper/explode/swell_goal