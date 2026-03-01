#> hvr:asset/mob/enemy.hazardous.inferno/tick/rapid_fire/
#
# Rapid Fire
#
# @within function hvr:asset/mob/enemy.hazardous.inferno/tick/in_hostile

# Summon fireball
    summon small_fireball ~ ~ ~ {Tags:["hvr.asset.mob.enemy.hazardous.inferno.rapid_fire.fireball","hvr.asset.mob.enemy.hazardous.inferno.rapid_fire.fireball_need_init"]}

# Set data
    data modify entity @n[type=small_fireball,tag=hvr.asset.mob.enemy.hazardous.inferno.rapid_fire.fireball_need_init] Owner set from entity @s UUID

# Set motion
    execute facing entity @n[tag=hvr.target] eyes in overworld positioned 0.0 0.0 0.0 run tp 1db9-0-0-0-0 ^ ^ ^2.0
    data modify entity @n[type=small_fireball,tag=hvr.asset.mob.enemy.hazardous.inferno.rapid_fire.fireball_need_init] Motion set from entity 1db9-0-0-0-0 Pos

# Remove tag
    tag @n[type=small_fireball,tag=hvr.asset.mob.enemy.hazardous.inferno.rapid_fire.fireball_need_init] remove hvr.asset.mob.enemy.hazardous.inferno.rapid_fire.fireball_need_init

# SFX
    playsound entity.blaze.shoot hostile @a[distance=..16] ~ ~ ~ 1 0.9