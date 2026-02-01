#> hvr:asset/mob/blaze/tick/explosive_fireball/set_data
#
# Set fireball data
#
# @within function fvre:asset/mob/blaze/explosive_fireball/search

# SFX
    playsound entity.breeze.shoot hostile @a[distance=..32] ~ ~ ~ 2 2
    particle lava ~ ~ ~ 0.0 0.0 0.0 0.3 4
    particle flame ~ ~ ~ 0.0 0.0 0.0 0.2 8

# Summon object
    data modify storage hvr:api __input__.id set value "enemy.explosive_fireball"
    data modify storage hvr:api __input__.field_override.target set value "@n[tag=hvr.target]"
    execute store result storage hvr:api __input__.field_override.origin int 1 run scoreboard players get @n[type=blaze,tag=hvr.this] hvr.mob_id
    function hvr:api/object/summon

# Kill origin fireball
    tag @s add hvr.vanish