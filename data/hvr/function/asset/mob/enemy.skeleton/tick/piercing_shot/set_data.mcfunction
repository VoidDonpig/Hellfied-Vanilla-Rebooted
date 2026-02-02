#> hvr:asset/mob/enemy.skeleton/tick/piercing_shot/set_data
#
# Set arrow data
#
# @within function fvre:asset/mob/skeleton/piercing_shot/search

# Set piercing level
    data modify entity @s PierceLevel set value 1

# SFX
    playsound minecraft:entity.wind_charge.wind_burst hostile @a[distance=..16] ~ ~ ~ 2 2
    particle crit ~ ~ ~ 0.0 0.0 0.0 0.8 16

# Set motion
    data modify storage hvr:lib __input__.vector_magnitude set value 3.2d
    data modify storage hvr:lib __input__.selector set value "@n[type=#hvr:living,tag=hvr.target]"
    function hvr:lib/arrow_motion/