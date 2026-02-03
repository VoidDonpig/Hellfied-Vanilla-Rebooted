#> hvr:asset/object/world.meteor/tick/move
#
# Move forward
#
# @within function
#   hvr:asset/object/world.meteor/tick/
#   hvr:asset/object/world.meteor/tick/move

# TP
    tp @s ~ ~ ~

# SFX
    execute if predicate hvr:interval/20t run playsound entity.breeze.idle_air ambient @a[distance=..128] ~ ~ ~ 2 0.5 0.1
    particle flash{color:[1f,1f,1f,1f]} ~ ~ ~ 0.0 0.0 0.0 0 1 force
    particle flame ~ ~ ~ 0.3 0.3 0.3 0.08 16
    particle large_smoke ~ ~ ~ 0.3 0.3 0.3 0.01 1
    particle dust_color_transition{from_color:[1.000,0.352,0.122],to_color:[0.431,0.220,0.039],scale:2} ~ ~ ~ 0.2 0.2 0.2 0 4
    particle dust_color_transition{from_color:[1.000,0.914,0.129],to_color:[1.000,0.988,0.839],scale:2} ~ ~ ~ 0.2 0.2 0.2 0 4

# Hit entity detection
    execute positioned ~-0.5 ~-0.5 ~-0.5 if entity @n[type=#hvr:living,type=!blaze,tag=!hvr.player_may_exception,dx=0] run function hvr:asset/object/world.meteor/tick/hit/

# Hit block detection
    execute if entity @s[tag=!hvr.vanish] unless block ~ ~ ~ #hvr:not_solid run function hvr:asset/object/world.meteor/tick/hit/

# Loop until out of count
    scoreboard players remove $remaining_loop hvr.temporary 1
    execute if entity @s[tag=!hvr.vanish] unless score $remaining_loop hvr.temporary matches ..0 positioned ^ ^ ^0.6 run function hvr:asset/object/world.meteor/tick/move