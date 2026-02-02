#> hvr:asset/mob/enemy.creeper/explode/summon_explosion
#
# Summon explosive creeper
#
# @within function
#   hvr:asset/mob/enemy.creeper/explode/exec
#   hvr:asset/mob/enemy.creeper/death

# Set data
    data modify entity @s Invulnerable set value true
    data modify entity @s Fuse set value 0s
    data modify entity @s ExplosionRadius set from storage hvr.__temp__:asset/mob __temp__.explosion_radius
    execute if data storage hvr.__temp__:asset/mob __temp__{powered:1b} run data modify entity @s powered set value true
    execute if data storage hvr.__temp__:asset/mob __temp__.custom_name run data modify entity @s CustomName set from storage hvr.__temp__:asset/mob __temp__.custom_name
    execute if data storage hvr.__temp__:asset/mob __temp__.active_effects run data modify entity @s active_effects set from storage hvr.__temp__:asset/mob __temp__.active_effects

# Declare no process mob
    tag @s add hvr.no_process

# Tp to origin location
    tp @s ~ ~-1024 ~

# Reset
    data remove storage hvr.__temp__:asset/mob __temp__