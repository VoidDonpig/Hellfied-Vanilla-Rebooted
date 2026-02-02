#> hvr:asset/mob/enemy.spider/tick/super_leap/while_leaping/
#
# While leaping process
#
# @within function hvr:asset/mob/enemy.spider/tick/

# No fall damage
    data modify entity @s fall_distance set value 0d

# Summon marker to target pos
    summon marker ~ ~ ~ {Tags:[hvr.asset.mob.spider.leaping_target_pos]}

# Facing
    execute as @n[type=marker,tag=hvr.asset.mob.spider.leaping_target_pos] at @s facing entity @n[tag=hvr.target] eyes run tp @s ~ ~ ~ ~ ~

# Edit Rotation
    data modify entity @s Rotation[0] set from entity @n[type=marker,tag=hvr.asset.mob.spider.leaping_target_pos] Rotation[0]

# Remove marker
    kill @n[type=marker,tag=hvr.asset.mob.spider.leaping_target_pos]

# When near target
    execute if entity @s[tag=!hvr.asset.mob.spider.leaping.motion_canceled] if entity @n[tag=hvr.target,distance=..16] run function hvr:asset/mob/enemy.spider/tick/super_leap/while_leaping/when_near_target/check