#> hvr:asset/mob/spider/tick/super_leap/while_leaping/when_near_target/
#
# When near target
#
# @within function hvr:asset/mob/spider/tick/super_leap/while_leaping/

# Set motion
    data modify entity @s Motion set value [0d,0d,0d]

# Add tag
    tag @s add hvr.asset.mob.spider.leaping.motion_canceled

# SFX
    particle poof ~ ~ ~ 0.6 0.3 0.6 0.04 8
    playsound entity.phantom.flap hostile @a[distance=..16] ~ ~ ~ 1 2