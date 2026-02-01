#> hvr:asset/mob/creeper/explode/exec
#
# Execute explosion
#
# @within function hvr:asset/mob/creeper/explode/swell

# Copy data
    data modify storage hvr.__temp__:asset/mob __temp__.explosion_radius set from entity @s ExplosionRadius
    data modify storage hvr.__temp__:asset/mob __temp__.powered set from entity @s powered
    data modify storage hvr.__temp__:asset/mob __temp__.custom_name set from entity @s CustomName
    data modify storage hvr.__temp__:asset/mob __temp__.active_effects set from entity @s active_effects

# Cause explosion
    execute positioned ~ ~1024 ~ summon creeper run function hvr:asset/mob/creeper/explode/summon_explosion

# Set swell
    scoreboard players set @s hvr.asset.mob.creeper.swell 1

# Flash
    particle flash{color:[1,1,1,1]} ~ ~ ~ 0.0 0.0 0.0 0 1

# Reload SFX
    execute unless data entity @s {ignited:1b} run function hvr:asset/mob/creeper/explode/reload_explosion_sfx

# If ignited, vanish
    execute if data entity @s {ignited:1b} run function hvr:asset/mob/creeper/explode/vanish