#> hvr:asset/mob/creeper/explode/swell_goal
#
# Swell goal manager
#
# @within function hvr:asset/mob/creeper/explode/swell_goal_can_use

# target == null
    execute unless entity @n[tag=hvr.target] run return run scoreboard players set $swell_dir hvr.temporary -1

# distance > 7?
    execute unless entity @n[tag=hvr.target,distance=..7] run return run scoreboard players set $swell_dir hvr.temporary -1

# 3 < distance < 7 && old_swear_dir == -1?
    execute unless entity @n[tag=hvr.target,distance=..3] if entity @n[tag=hvr.target,distance=..7] if score @s hvr.mob_asset.creeper.old_swell_dir matches -1 run return run scoreboard players set $swell_dir hvr.temporary -1

# hasLineOfSight?
    # If creeper is hostile, may have line of sight
        execute if predicate hvr:in_hostile run return run scoreboard players set $swell_dir hvr.temporary 1
    # If not, -1
        scoreboard players set $swell_dir hvr.temporary -1