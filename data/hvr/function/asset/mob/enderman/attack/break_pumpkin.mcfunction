#> hvr:asset/mob/enderman/attack/break_pumpkin
#
# Break wearing pumpkin
#
# @within function hvr:asset/mob/enderman/attack/

# Remove pumpkin
    item replace entity @s armor.head with air

# Spawn pumpkin seed
    execute anchored eyes positioned ^ ^ ^ run summon item ~ ~ ~ {Item:{id:"pumpkin_seeds",count:4},PickupDelay:10,Tags:[hvr.asset.mob.enderman.broken_pumpkin_seeds_need_init]}

# Random motion
    scoreboard players set $ hvr.temporary 200

    execute store result score $additive_motion_x hvr.temporary run random value 0..65535
    scoreboard players operation $additive_motion_x hvr.temporary %= $ hvr.temporary
    scoreboard players operation $motion_x hvr.temporary += $additive_motion_x hvr.temporary

    execute store result score $additive_motion_z hvr.temporary run random value 0..65535
    scoreboard players operation $additive_motion_z hvr.temporary %= $ hvr.temporary
    scoreboard players operation $motion_z hvr.temporary += $additive_motion_z hvr.temporary

    execute store result score $subtractive_motion_x hvr.temporary run random value 0..65535
    scoreboard players operation $subtractive_motion_x hvr.temporary %= $ hvr.temporary
    scoreboard players operation $motion_x hvr.temporary -= $subtractive_motion_x hvr.temporary

    execute store result score $subtractive_motion_z hvr.temporary run random value 0..65535
    scoreboard players operation $subtractive_motion_z hvr.temporary %= $ hvr.temporary
    scoreboard players operation $motion_z hvr.temporary -= $subtractive_motion_z hvr.temporary
    # Apply motion
        data modify storage hvr.__temp__:asset/mob motion set value [0d,0.2d,0d]
        execute store result storage hvr.__temp__:asset/mob motion[0] double 0.001 run scoreboard players get $motion_x hvr.temporary
        execute store result storage hvr.__temp__:asset/mob motion[2] double 0.001 run scoreboard players get $motion_z hvr.temporary
        data modify entity @n[type=item,tag=hvr.asset.mob.enderman.broken_pumpkin_seeds_need_init] Motion set from storage hvr.__temp__:asset/mob motion
    # Reset
        tag @n[type=item,tag=hvr.asset.mob.enderman.broken_pumpkin_seeds_need_init] remove hvr.asset.mob.enderman.broken_pumpkin_seeds_need_init
        data remove storage hvr.__temp__:asset/mob motion
        scoreboard players reset $ hvr.temporary
        scoreboard players reset $motion_x hvr.temporary
        scoreboard players reset $motion_z hvr.temporary
        scoreboard players reset $additive_motion_x hvr.temporary
        scoreboard players reset $additive_motion_z hvr.temporary
        scoreboard players reset $subtractive_motion_x hvr.temporary
        scoreboard players reset $subtractive_motion_z hvr.temporary

# SFX
    execute anchored eyes positioned ^ ^ ^ run playsound block.wood.break block @a[distance=..8] ~ ~ ~
    execute anchored eyes positioned ^ ^ ^ run particle block{block_state:"pumpkin"} ~ ~ ~ 0.4 0.4 0.4 0 16