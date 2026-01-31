#> hvr:asset/mob/spider/tick/super_leap/
#
# Super leap process
#
# @within function hvr:asset/mob/spider/tick/

# Add charging time
    scoreboard players add @s hvr.mob_asset.spider.super_leap.charging_time 1

# If just begin charging, first event fetched
    execute if entity @s[scores={hvr.mob_asset.spider.super_leap.charging_time=1}] run function hvr:asset/mob/spider/tick/super_leap/start_charging

# Leap
    execute if entity @s[scores={hvr.mob_asset.spider.super_leap.charging_time=60..}] run function hvr:asset/mob/spider/tick/super_leap/leap_toward_target