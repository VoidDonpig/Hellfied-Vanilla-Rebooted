#> hvr:asset/object/enemy.explosive_fireball/tick/move
#
# Move forward
#
# @within function
#   hvr:asset/object/enemy.explosive_fireball/tick/
#   hvr:asset/object/enemy.explosive_fireball/tick/move

# TP
    tp @s ~ ~ ~

# Hit entity detection
    execute positioned ~-0.5 ~-0.5 ~-0.5 if entity @n[type=#hvr:living,type=!blaze,tag=!hvr.player_may_exception,dx=0] run function hvr:asset/object/enemy.explosive_fireball/tick/hit/

# Hit block detection
    execute if entity @s[tag=!hvr.vanish] unless block ~ ~ ~ #hvr:not_solid run function hvr:asset/object/enemy.explosive_fireball/tick/hit/

# Loop until out of count
    scoreboard players remove $remaining_loop hvr.temporary 1
    execute if entity @s[tag=!hvr.vanish] unless score $remaining_loop hvr.temporary matches ..0 positioned ^ ^ ^0.6 run function hvr:asset/object/enemy.explosive_fireball/tick/move