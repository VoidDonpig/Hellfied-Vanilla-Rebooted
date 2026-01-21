#> hvr:asset/mob/creeper/explode/exec
#
# Execute explosion
#
# @within function hvr:asset/mob/creeper/explode/swell

# Cause explosion
    execute positioned ~ ~1024 ~ summon creeper run function hvr:asset/mob/creeper/explode/summon_explosion

# Set swell
    scoreboard players set @s hvr.mob_asset.creeper.swell 1

# Reload SFX
    function hvr:asset/mob/creeper/explode/reload_explosion_sfx

# If ignited, vanish
    execute if data entity @s {ignited:1b} run function hvr:asset/mob/creeper/explode/vanish