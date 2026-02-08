#> hvr:asset/mob/enemy.piglin_brute/hurt
#
# Hurt process
#
# @within function hvr:entity_manager/mob/event/hurt/dispatch/m

# If attacked by player, change to agroo mode
    execute if entity @p[tag=hvr.attacker] as @e[type=piglin,tag=!hvr.asset.mob.enemy.piglin_agroo,distance=..48] run function hvr:asset/mob/enemy.piglin/hurt/activate_agroo_mode