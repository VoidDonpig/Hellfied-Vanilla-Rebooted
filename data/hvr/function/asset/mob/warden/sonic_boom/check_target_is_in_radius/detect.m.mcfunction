#> hvr:asset/mob/warden/sonic_boom/check_target_is_in_radius/detect.m
#
# Check target is in the radius
#
# @within function hvr:asset/mob/warden/sonic_boom/check_target_is_in_radius/check

$execute as @n[type=#hvr:living,tag=hvr.target] at @s positioned $(x) ~ $(z) unless entity @s[distance=15] at @s[distance=..15] positioned ~ $(y) ~ unless entity @s[distance=20] at @s[distance=..20] run data modify storage hvr.__temp__:asset/mob sonic_boom_ready set value true
