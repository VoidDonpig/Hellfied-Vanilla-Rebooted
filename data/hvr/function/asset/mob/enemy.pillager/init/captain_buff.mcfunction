#> hvr:asset/mob/enemy.pillager/init/captain_buff
#
# Captain buff
#
# @within function hvr:asset/mob/enemy.pillager/init/

# Increase follow range
    attribute @s follow_range modifier add hvr:asset/mob/enemy.pillager.follow_range.captain_buff 7 add_multiplied_total

# Increase Health
    attribute @s max_health modifier add hvr:asset/mob/enemy.pillager.max_health.captain_buff 1 add_multiplied_total

# Increase speed
    attribute @s movement_speed modifier add hvr:asset/mob/enemy.pillager.movement_speed.captain_buff 0.2 add_multiplied_total

# Set Health
    execute store result entity @s Health float 0.01 run attribute @s max_health get 100