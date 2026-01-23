#> hvr:core/tick/world
#
# World tick
#
# @within function hvr:core/tick/main

# Add shot tag projectile
    execute as @e[type=#hvr:projectiles,tag=!hvr.projectile_already_tick] run tag @s add hvr.projectile_already_tick

# Prevent invade unsafe area
    execute in minecraft:overworld positioned -1 -64 -1 as @e[dx=2,dy=1,dz=2] run tp @s 0 -62 0

# Immediately kill item have sys ench
    execute as @e[type=item] if items entity @s container.0 *[enchantments~[{enchantments:["hvr:entity_manager/mob/sys"]}]] run kill @s

# Weather
    function hvr:world_manager/weather/tick

# Autokill
    execute as @e[tag=hvr.autokill] run function hvr:world_manager/autokill/tick