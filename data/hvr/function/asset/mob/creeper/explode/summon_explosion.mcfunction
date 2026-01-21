#> hvr:asset/mob/creeper/explode/summon_explosion
#
# Summon explosive creeper
#
# @within function hvr:asset/mob/creeper/explode/exec

# Set data
    data modify entity @s Invulnerable set value true
    data modify entity @s Fuse set value 0s
    data modify entity @s ExplosionRadius set from entity @n[tag=hvr.this] ExplosionRadius
    execute if data entity @n[tag=hvr.this] {powered:1b} run data modify entity @s powered set value true
    execute if data entity @n[tag=hvr.this] CustomName run data modify entity @s CustomName set from entity @n[tag=hvr.this] CustomName
    execute if data entity @n[tag=hvr.this] active_effects run data modify entity @s active_effects set from entity @n[tag=hvr.this] active_effects

# Declare no process mob
    tag @s add hfv.no_process_mob

# Tp to origin location
    tp @s ~ ~-1024 ~