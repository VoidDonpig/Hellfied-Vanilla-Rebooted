#> hvr:asset/object/enemy.explosive_fireball/tick/hit/
#
# Hit process
#
# @within function hvr:asset/object/enemy.explosive_fireball/tick/move

# SFX
    playsound entity.generic.explode hostile @a[distance=..32] ~ ~ ~ 2 1.2

# Explosion
    summon armor_stand ~ ~ ~ {equipment:{body:{id:"stone_button",components:{enchantments:{"hvr:asset/object/enemy.explosive_fireball/explosion":1}}}},Silent:true,Marker:true,Invisible:true}

# Kill
    tag @s add hvr.vanish