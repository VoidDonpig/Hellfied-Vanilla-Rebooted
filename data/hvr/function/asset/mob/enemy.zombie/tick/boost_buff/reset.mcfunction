#> hvr:asset/mob/enemy.zombie/tick/boost_buff/reset
#
# Reset boosting
#
# @within function hvr:asset/mob/enemy.zombie/tick/boost_buff/increment_timer

# Remove attributes
    attribute @s movement_speed modifier remove hvr:asset/mob/zombie.boost_buff.movement_speed
    attribute @s attack_damage modifier remove hvr:asset/mob/zombie.boost_buff.attack_damage

# Remove tag
    tag @s remove hvr.asset.mob.zombie.boosting

# SFX
    execute anchored eyes positioned ^ ^ ^ run particle smoke ~ ~ ~ 0.4 0.4 0.4 0.01 16
    execute anchored eyes positioned ^ ^ ^ run playsound block.fire.extinguish hostile @a[distance=..16] ~ ~ ~ 1 2

# Rebound
    execute unless score $difficulty hvr.global matches 4.. run function hvr:asset/mob/enemy.zombie/tick/boost_buff/give_rebound_debuff

# Reset timer
    scoreboard players reset @s hvr.asset.mob.zombie.boost_buff_activating_timer