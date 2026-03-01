#> hvr:asset/mob/enemy.hazardous.inferno/tick/fire_wave/
#
# Fire Wave
#
# @within function hvr:asset/mob/enemy.hazardous.inferno/tick/in_hostile

#> Private
# @private
#declare score_holder $
#declare score_holder $x_rotation
#declare score_holder $z_rotation
#declare score_holder $x_rotation_additive
#declare score_holder $x_rotation_subtractive
#declare score_holder $z_rotation_additive
#declare score_holder $z_rotation_subtractive

# Summon fireball
    summon small_fireball ~ ~ ~ {Tags:["hvr.asset.mob.enemy.hazardous.inferno.fire_wave.fireball","hvr.asset.mob.enemy.hazardous.inferno.fire_wave.fireball_need_init"]}

# Set current rotation
    execute facing entity @n[tag=hvr.target] eyes run rotate 1db9-0-0-0-0 ~ ~
    execute store result score $x_rotation hvr.temporary run data get entity 1db9-0-0-0-0 Rotation[0] 10
    execute store result score $z_rotation hvr.temporary run data get entity 1db9-0-0-0-0 Rotation[1] 10

# Random rotation modifier
    scoreboard players set $ hvr.temporary 550

    execute store result score $x_rotation_additive hvr.temporary run random value 0..65535
    scoreboard players operation $x_rotation_additive hvr.temporary %= $ hvr.temporary

    execute store result score $x_rotation_subtractive hvr.temporary run random value 0..65535
    scoreboard players operation $x_rotation_subtractive hvr.temporary %= $ hvr.temporary

    scoreboard players set $ hvr.temporary 150

    execute store result score $z_rotation_additive hvr.temporary run random value 0..65535
    scoreboard players operation $z_rotation_additive hvr.temporary %= $ hvr.temporary

    execute store result score $z_rotation_subtractive hvr.temporary run random value 0..65535
    scoreboard players operation $z_rotation_subtractive hvr.temporary %= $ hvr.temporary

# Set rotation
    scoreboard players operation $x_rotation hvr.temporary += $x_rotation_additive hvr.temporary
    scoreboard players operation $x_rotation hvr.temporary -= $x_rotation_subtractive hvr.temporary
    scoreboard players operation $z_rotation hvr.temporary += $z_rotation_additive hvr.temporary
    scoreboard players operation $z_rotation hvr.temporary -= $z_rotation_subtractive hvr.temporary
    data modify storage hvr.__temp__:asset/mob rotation set value [0d,0d]
    execute store result storage hvr.__temp__:asset/mob rotation[0] double 0.1 run scoreboard players get $x_rotation hvr.temporary
    execute store result storage hvr.__temp__:asset/mob rotation[1] double 0.1 run scoreboard players get $z_rotation hvr.temporary
    data modify entity 1db9-0-0-0-0 Rotation set from storage hvr.__temp__:asset/mob rotation

# Set data
    data modify entity @n[type=small_fireball,tag=hvr.asset.mob.enemy.hazardous.inferno.fire_wave.fireball_need_init] Owner set from entity @s UUID

# Set motion
    execute rotated as 1db9-0-0-0-0 in overworld positioned 0.0 0.0 0.0 run tp 1db9-0-0-0-0 ^ ^ ^1.0
    data modify entity @n[type=small_fireball,tag=hvr.asset.mob.enemy.hazardous.inferno.fire_wave.fireball_need_init] Motion set from entity 1db9-0-0-0-0 Pos

# Remove tag
    tag @n[type=small_fireball,tag=hvr.asset.mob.enemy.hazardous.inferno.fire_wave.fireball_need_init] remove hvr.asset.mob.enemy.hazardous.inferno.fire_wave.fireball_need_init

# SFX
    playsound entity.blaze.shoot hostile @a[distance=..16] ~ ~ ~ 1 0.9

# Reset
    scoreboard players reset $ hvr.temporary
    scoreboard players reset $x_rotation hvr.temporary
    scoreboard players reset $z_rotation hvr.temporary
    scoreboard players reset $x_rotation_additive hvr.temporary
    scoreboard players reset $x_rotation_subtractive hvr.temporary
    scoreboard players reset $z_rotation_additive hvr.temporary
    scoreboard players reset $z_rotation_subtractive hvr.temporary
