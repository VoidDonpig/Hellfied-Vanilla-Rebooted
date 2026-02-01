#> hvr:world/tick
#
# World tick
#
# @within function hvr:core/tick/main

# Add shot tag projectile
    execute as @e[type=#hvr:projectiles,tag=!hvr.projectile_already_tick] run tag @s add hvr.projectile_already_tick

# Prevent invade unsafe area
    execute in minecraft:overworld positioned -1 -64 -1 as @e[dx=2,dy=1,dz=2] run tp @s 0 -62 0

# Immediately kill item have sys ench
    execute as @e[type=item,tag=!hvr.item_ticked] if items entity @s container.0 *[enchantments~[{enchantments:["hvr:entity_manager/mob/sys"]}]] run kill @s

# Weather
    execute if predicate hvr:weather/is_raining run function hvr:world_manager/weather/rain/
    execute if predicate hvr:weather/is_lightning run function hvr:world_manager/weather/thunderstorm/

# Autokill
    execute as @e[tag=hvr.autokill] run function hvr:world_manager/autokill/

# Add item spawned tag
    tag @e[type=item,tag=!hvr.item_ticked] add hvr.item_ticked