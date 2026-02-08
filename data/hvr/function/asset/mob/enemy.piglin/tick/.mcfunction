#> hvr:asset/mob/enemy.piglin/tick/
#
# Tick process
#
# @within function hvr:entity_manager/mob/event/tick/dispatch/m

# Force hostile
    execute if entity @s[tag=hvr.asset.mob.enemy.piglin_agroo,predicate=!hvr:in_hostile] if entity @n[type=#hvr:asset/mob/enemy.piglin/force_hostile_target,tag=!hvr.player_may_exception,distance=..16] unless data entity @s Brain.memories."minecraft:angry_at" run function hvr:asset/mob/enemy.piglin/tick/force_hostile