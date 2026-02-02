#> hvr:asset/mob/enemy.enderman/attack
#
# Attack process
#
# @within function hvr:entity_manager/mob/event/attack/dispatch/m

# Break victim wearing pumpkin
    execute if data storage hvr:asset/context {damage_type:"is_melee"} as @n[type=#hvr:living,tag=hvr.victim,predicate=hvr:asset/mob/enemy.enderman/is_wearing_pumpkin] at @s run function hvr:asset/mob/enemy.enderman/attack/break_pumpkin