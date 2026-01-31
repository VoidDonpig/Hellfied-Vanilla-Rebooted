#> hvr:asset/mob/spider/attack/
#
# Attack process
#
# @within function hvr:entity_manager/mob/event/attack/dispatch/m

# If leaping, set motion 0
    execute if entity @s[tag=hvr.mob_asset.spider.leaping] run data modify entity @s Motion set value [0d,0d,0d]

# Set cooldown
    scoreboard players set @s[tag=!hvr.mob_asset.spider.leaping] hvr.mob_asset.spider.super_leap.cooldown 40