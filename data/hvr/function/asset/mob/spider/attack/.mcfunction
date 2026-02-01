#> hvr:asset/mob/spider/attack/
#
# Attack process
#
# @within function hvr:entity_manager/mob/event/attack/dispatch/m

# If leaping, set motion 0
    execute if entity @s[tag=hvr.asset.mob.spider.leaping] run data modify entity @s Motion set value [0d,0d,0d]

# Set cooldown
    scoreboard players set @s[tag=!hvr.asset.mob.spider.leaping] hvr.asset.mob.spider.super_leap.cooldown 40