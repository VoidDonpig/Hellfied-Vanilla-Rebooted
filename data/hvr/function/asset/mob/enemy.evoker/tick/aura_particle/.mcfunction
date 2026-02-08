#> hvr:asset/mob/enemy.evoker/tick/aura_particle/
#
# Aura particle generation
#
# @within function hvr:asset/mob/enemy.evoker/tick/

# Generate particle
    execute \
    at @e[type=marker,tag=hvr.asset.mob.enemy.evoker.axis] \
    at @e[type=marker,tag=hvr.asset.mob.enemy.evoker.axis] \
    at @e[type=marker,tag=hvr.asset.mob.enemy.evoker.axis] \
    at @s \
    \
    rotated as @n[type=marker,tag=hvr.asset.mob.enemy.evoker.axis,sort=random] rotated ~ 0 positioned ^ ^ ^2 \
    rotated as @n[type=marker,tag=hvr.asset.mob.enemy.evoker.axis,sort=random] positioned ^2 ^ ^ \
    rotated as @n[type=marker,tag=hvr.asset.mob.enemy.evoker.axis,sort=random] positioned ^ ^ ^2 \
    \
    rotated as @n[type=marker,tag=hvr.asset.mob.enemy.evoker.axis,sort=random] rotated ~ 0 positioned ^ ^ ^1 \
    rotated as @n[type=marker,tag=hvr.asset.mob.enemy.evoker.axis,sort=random] positioned ^1 ^ ^ \
    rotated as @n[type=marker,tag=hvr.asset.mob.enemy.evoker.axis,sort=random] positioned ^ ^ ^1 \
    \
    rotated as @n[type=marker,tag=hvr.asset.mob.enemy.evoker.axis,sort=random] rotated ~ 0 positioned ^ ^ ^0.5 \
    rotated as @n[type=marker,tag=hvr.asset.mob.enemy.evoker.axis,sort=random] positioned ^0.5 ^ ^ \
    rotated as @n[type=marker,tag=hvr.asset.mob.enemy.evoker.axis,sort=random] positioned ^ ^ ^0.5 \
    \
    facing entity @s feet \
    positioned as @s[distance=..4] \
    \
    anchored eyes positioned ^ ^ ^4 run function hvr:asset/mob/enemy.evoker/tick/aura_particle/generate

# SFX
    execute anchored eyes positioned ^ ^ ^ run particle sculk_charge{roll:1.57} ~ ~ ~ 1.2 1.2 1.2 0 2 force
    execute if predicate hvr:interval/4t anchored eyes positioned ^ ^ ^ run playsound block.sculk.charge hostile @a[distance=..16] ~ ~ ~ 1 0.5 0
    execute if predicate hvr:interval/80t anchored eyes positioned ^ ^ ^ run playsound entity.wither.ambient hostile @a[distance=..16] ~ ~ ~ 0.3 1.5 0
