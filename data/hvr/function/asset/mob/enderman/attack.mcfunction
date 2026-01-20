#> hvr:asset/mob/enderman/attack
#
# Attack process
#
# @within function hvr:entity_manager/mob/event/attack/dispatch/dispatcher.m

# Break victim wearing pumpkin
    execute if data storage hvr:asset/context {damage_type:"is_melee"} as @n[tag=hvr.victim,predicate=hvr:asset/mob/enderman/is_wearing_pumpkin] at @s run function hvr:asset/mob/enderman/break_pumpkin