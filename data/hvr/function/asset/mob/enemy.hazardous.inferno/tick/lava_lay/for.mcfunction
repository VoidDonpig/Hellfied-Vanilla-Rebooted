#> hvr:asset/mob/enemy.hazardous.inferno/tick/lava_lay/for
#
# Repeat til reach limit
#
# @within function
#   hvr:asset/mob/enemy.hazardous.inferno/tick/lava_lay/
#   hvr:asset/mob/enemy.hazardous.inferno/tick/lava_lay/for

# Add tag to victim
    execute positioned ~-0.5 ~-0.5 ~-0.5 as @n[tag=hvr.target,dx=0] run tag @s add hvr.asset.mob.enemy.hazardous.inferno.lava_lay_hit

# SFX
    particle lava ~ ~ ~ 0.04 0.04 0.04 0 4

# Repeat until reach limit
    execute positioned ^ ^ ^0.4 if block ~ ~ ~ #hvr:not_solid if entity @s[distance=..32] run function hvr:asset/mob/enemy.hazardous.inferno/tick/lava_lay/for