#> hvr:core/tick/world/
#
# World tick
#
# @within function hvr:core/tick/main

# Add shot tag projectile
    execute as @e[type=#hvr:projectiles,tag=!hvr.projectile_ticked] run tag @s add hvr.projectile_ticked

# Prevent invade unsafe area
    execute in minecraft:overworld positioned -1 -64 -1 as @e[dx=2,dy=1,dz=2] run tp @s 0 -62 0

# Weather
    execute if predicate hvr:weather/is_raining run function hvr:world_manager/weather/rain/
    execute if predicate hvr:weather/is_lightning run function hvr:world_manager/weather/thunderstorm/

# Random phenomenon
    function hvr:world_manager/phenomenon/