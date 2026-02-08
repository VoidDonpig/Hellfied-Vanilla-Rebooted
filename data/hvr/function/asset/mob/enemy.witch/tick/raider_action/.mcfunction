#> hvr:asset/mob/enemy.witch/tick/raider_action/
#
# Raider action
#
# @within function hvr:asset/mob/enemy.witch/tick/

# Provide insane buff to raider
    execute as @e[type=#hvr:can_join_raid,tag=hvr.asset.mob.raider,tag=!hvr.asset.mob.raider.already_given_witch_buff,distance=..16] at @s run function hvr:asset/mob/enemy.witch/tick/raider_action/give_buff