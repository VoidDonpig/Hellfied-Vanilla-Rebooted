#> hvr:asset/mob/enemy.creeper/death/
#
# Death process
#
# @within function
#   hvr:entity_manager/mob/event/death/dispatch/m
#   hvr:asset/mob/enemy.creeper/killed/

# Copy data
    data modify storage hvr.__temp__:asset/mob __temp__.explosion_radius set from entity @s ExplosionRadius
    data modify storage hvr.__temp__:asset/mob __temp__.powered set from entity @s powered
    data modify storage hvr.__temp__:asset/mob __temp__.custom_name set from entity @s CustomName
    data modify storage hvr.__temp__:asset/mob __temp__.active_effects set from entity @s active_effects

# Cause explosion
    execute positioned ~ ~1024 ~ summon creeper run function hvr:asset/mob/enemy.creeper/explode/summon_explosion

# Flash
    particle flash{color:[1,1,1,1]} ~ ~ ~ 0.0 0.0 0.0 0 1