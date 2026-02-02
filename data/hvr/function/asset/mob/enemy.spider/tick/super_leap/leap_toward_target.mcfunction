#> hvr:asset/mob/enemy.spider/tick/super_leap/leap_toward_target
#
# Leap!
#
# @within function hvr:asset/mob/enemy.spider/tick/super_leap/

# Apply Motion
    execute positioned ~ ~ ~ run function hvr:asset/mob/enemy.spider/tick/super_leap/motion/

# SFX
    particle poof ~ ~ ~ 0.0 0.0 0.0 0.2 16
    playsound entity.witch.throw hostile @a[distance=..16] ~ ~ ~ 1 1.2

# Add leaping tag
    tag @s add hvr.asset.mob.spider.leaping

# Reset score
    scoreboard players reset @s hvr.asset.mob.spider.super_leap.charging_time