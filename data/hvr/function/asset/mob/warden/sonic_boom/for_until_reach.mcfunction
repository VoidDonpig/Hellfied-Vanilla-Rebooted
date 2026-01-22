#> hvr:asset/mob/warden/sonic_boom/for_until_reach
#
# Repeat process
#
# @within function
#   hvr:asset/mob/warden/sonic_boom/proc
#   hvr:asset/mob/warden/sonic_boom/for_until_reach

# Destroy block
    function hvr:asset/mob/warden/sonic_boom/destroy_block

# SFX
    particle soul_fire_flame ~ ~ ~ 0.4 0.4 0.4 0.08 8
    particle soul ~ ~ ~ 0.4 0.4 0.4 0.08 8
    particle sonic_boom ~ ~ ~
    playsound entity.warden.sonic_boom hostile @a[distance=..48] ~ ~ ~ 3 0.8
    playsound entity.warden.sonic_boom hostile @a[distance=..48] ~ ~ ~ 3 1
    playsound block.sculk_shrieker.shriek hostile @a[distance=..48] ~ ~ ~ 3 0.7
    playsound entity.allay.death hostile @a[distance=..48] ~ ~ ~ 3 0.5
    playsound block.beacon.power_select hostile @a[distance=..48] ~ ~ ~ 3 0.8

# Damage
    execute positioned ~-1 ~-1 ~-1 as @e[type=#hvr:living,type=!warden,dx=2,dy=2,dz=2] run function hvr:asset/mob/warden/sonic_boom/damage

# Decrement count
    scoreboard players remove $sonic_boom_length hvr.temporary 1

# Repeat until reach
    execute unless score $sonic_boom_length hvr.temporary matches ..0 positioned ^ ^ ^1 run function hvr:asset/mob/warden/sonic_boom/for_until_reach