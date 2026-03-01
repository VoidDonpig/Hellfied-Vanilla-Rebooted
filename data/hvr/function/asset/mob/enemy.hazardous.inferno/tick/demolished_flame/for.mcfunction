#> hvr:asset/mob/enemy.hazardous.inferno/tick/demolished_flame/for
#
# Summon fireball
#
# @within function
#   hvr:asset/mob/enemy.hazardous.inferno/tick/demolished_flame/
#   hvr:asset/mob/enemy.hazardous.inferno/tick/demolished_flame/for

# Summon object
    data modify storage hvr:api __input__.id set value "enemy.explosive_fireball"
    execute store result storage hvr:api __input__.field_override.origin int 1 run scoreboard players get @n[type=blaze,tag=hvr.this] hvr.mob_id
    function hvr:api/object/summon

# Set rotation
    rotate @n[type=item_display,tag=hvr.asset.object.enemy.explosive_fireball,tag=!hvr.asset.mob.enemy.hazardous.inferno.demolished_flame_init,distance=..0.001] ~ ~

# Add init tag
    tag @n[type=item_display,tag=hvr.asset.object.enemy.explosive_fireball,tag=!hvr.asset.mob.enemy.hazardous.inferno.demolished_flame_init,distance=..0.001] add hvr.asset.mob.enemy.hazardous.inferno.demolished_flame_init

# Repeat until reach limit
    scoreboard players remove $remaining_loop hvr.temporary 1
    execute unless score $remaining_loop hvr.temporary matches ..0 rotated ~15 ~ run function hvr:asset/mob/enemy.hazardous.inferno/tick/demolished_flame/for
