#> hvr:asset/mob/enemy.evoker/tick/anti_projectile/check
#
# Anti projectile check
#
# @within function hvr:asset/mob/enemy.evoker/tick/

# Check if the origin is illager
    execute on origin if entity @s[type=#illager] run scoreboard players set $is_illager_projectile hvr.temporary 1

# If not, vanish
    execute unless score $is_illager_projectile hvr.temporary matches 1 at @s run function hvr:asset/mob/enemy.evoker/tick/anti_projectile/

# Add checked tag
    tag @s add hvr.asset.mob.enemy.evoker_already_passed_projectile

# Reset
    scoreboard players reset $is_illager_projectile hvr.temporary