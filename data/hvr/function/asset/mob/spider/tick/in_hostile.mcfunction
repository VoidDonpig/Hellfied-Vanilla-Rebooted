#> hvr:asset/mob/spider/tick/in_hostile
#
# Hostile tick
#
# @within function hvr:asset/mob/spider/tick/in_hostile

# If CD is ok, start leaping
    execute unless score @s hvr.asset.mob.spider.super_leap.cooldown matches 1.. run function hvr:asset/mob/spider/tick/super_leap/