#> hvr:asset/object/enemy.explosive_fireball/tick/hit/
#
# Hit process
#
# @within function hvr:asset/object/enemy.explosive_fireball/tick/move

# SFX
    playsound entity.generic.explode hostile @a[distance=..32] ~ ~ ~ 2 1.2

# Kill
    tag @s add hvr.vanish