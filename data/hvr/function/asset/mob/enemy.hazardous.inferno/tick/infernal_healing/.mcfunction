#> hvr:asset/mob/enemy.hazardous.inferno/tick/infernal_healing/
#
# Infernal Healing
#
# @within function hvr:asset/mob/enemy.hazardous.inferno/tick/in_hostile

# Insta heal
    effect give @s instant_health 1 3

# SFX
    execute anchored eyes positioned ^ ^ ^ run playsound entity.zombie_villager.cure hostile @a[distance=..16] ~ ~ ~ 1 2
    execute anchored eyes positioned ^ ^ ^ run particle heart ~ ~ ~ 0.0 0.0 0.0 0 1