#> hvr:asset/mob/enemy.hazardous.inferno/tick/demolished_flame/
#
# Demolished Flame
#
# @within function hvr:asset/mob/enemy.hazardous.inferno/tick/in_hostile

# Summon fireball
    scoreboard players set $remaining_loop hvr.temporary 24
    execute anchored eyes positioned ^ ^ ^ rotated 0 0 run function hvr:asset/mob/enemy.hazardous.inferno/tick/demolished_flame/for

# SFX
    execute anchored eyes positioned ^ ^ ^ run playsound entity.blaze.shoot hostile @a[distance=..32] ~ ~ ~ 2 0.5