#> hvr:asset/mob/enemy.hazardous.inferno/tick/lava_lay/predict/for
#
# Repeat til reach limit
#
# @within function
#   hvr:asset/mob/enemy.hazardous.inferno/tick/lava_lay/predict/
#   hvr:asset/mob/enemy.hazardous.inferno/tick/lava_lay/predict/for

# SFX
    particle smoke ~ ~ ~ 0.04 0.04 0.04 0 2
    particle small_flame ~ ~ ~ 0.04 0.04 0.04 0 1

# Repeat until reach limit
    execute positioned ^ ^ ^0.4 if block ~ ~ ~ #hvr:not_solid if entity @s[distance=..32] run function hvr:asset/mob/enemy.hazardous.inferno/tick/lava_lay/predict/for