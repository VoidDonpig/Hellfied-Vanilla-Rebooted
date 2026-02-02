#> hvr:asset/mob/enemy.wither_skeleton/tick/in_hostile
#
# In hostile tick
#
# @within function hvr:asset/mob/enemy.wither_skeleton/tick/

# Mode switch
    # Melee
        execute if entity @s[tag=hvr.asset.mob.wither_skeleton.range_mode] if entity @n[tag=hvr.target,distance=..5] run function hvr:asset/mob/enemy.wither_skeleton/tick/mode_switch/melee
    # Range
        execute if entity @s[tag=hvr.asset.mob.wither_skeleton.melee_mode] if entity @n[tag=hvr.target,distance=6..16] run function hvr:asset/mob/enemy.wither_skeleton/tick/mode_switch/range