#> hvr:asset/mob/warden/sonic_boom/check_target_is_in_radius/detect.m
#
# Check target is in the radius
#
# @within function hvr:asset/mob/warden/sonic_boom/check_target_is_in_radius/check

$execute as @n[tag=hvr.target] at @s positioned $(x) ~ $(z) at @s[distance=..15] positioned ~ $(y) ~ positioned ~ ~10 ~ at @s[distance=..10] run data modify storage hvr.__temp__:asset/mob __temp__.sonic_boom_ready set value true
