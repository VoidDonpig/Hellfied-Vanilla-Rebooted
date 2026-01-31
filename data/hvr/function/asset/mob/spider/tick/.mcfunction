#> hvr:asset/mob/spider/tick/
#
# Tick process
#
# @within function hvr:entity_manager/mob/event/tick/dispatch/m

# Reset when not hostile
    execute unless predicate hvr:in_hostile run function hvr:asset/mob/spider/reset/

# Remove super leap CD
    scoreboard players remove @s[scores={hvr.mob_asset.spider.super_leap.cooldown=1..}] hvr.mob_asset.spider.super_leap.cooldown 1

# When in hostile
    execute if entity @s[tag=!hvr.mob_asset.spider.leaping] if predicate hvr:in_hostile run function hvr:asset/mob/spider/tick/in_hostile

# While leaping process
    execute if entity @s[tag=hvr.mob_asset.spider.leaping] run function hvr:asset/mob/spider/tick/super_leap/while_leaping/

# Add endable tag
    execute if entity @s[tag=hvr.mob_asset.spider.leaping,tag=!hvr.is_on_ground] run tag @s add hvr.mob_asset.spider.leaping.endable

# When on land
    execute if entity @s[tag=hvr.mob_asset.spider.leaping.endable,tag=hvr.is_on_ground] run function hvr:asset/mob/spider/tick/super_leap/on_land
    execute if entity @s[tag=hvr.mob_asset.spider.leaping.endable,tag=!hvr.is_on_ground,predicate=hvr:is_in_water] run function hvr:asset/mob/spider/tick/super_leap/on_land