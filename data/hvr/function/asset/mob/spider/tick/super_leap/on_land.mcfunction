#> hvr:asset/mob/spider/tick/super_leap/on_land
#
# On land process
#
# @within function hvr:asset/mob/spider/tick/

# SFX
    particle block{block_state:"dirt"} ~ ~ ~ 2.0 0.1 2.0 0 64
    playsound entity.player.big_fall hostile @a[distance=..16] ~ ~ ~ 1 0.8

# Remove leaping tag
    tag @s remove hvr.mob_asset.spider.leaping
    tag @s remove hvr.mob_asset.spider.leaping.endable
    tag @s remove hvr.mob_asset.spider.leaping.motion_canceled

# Set cooldown
    scoreboard players set @s hvr.mob_asset.spider.super_leap.cooldown 100