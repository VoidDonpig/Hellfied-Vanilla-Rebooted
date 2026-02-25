#> hvr:core/tick/world/
#
# World tick
#
# @within function hvr:core/tick/main

# Add shot tag projectile
    execute as @e[type=#hvr:projectiles,tag=!hvr.projectile_ticked] run tag @s add hvr.projectile_ticked

# Prevent invade unsafe area
    execute in minecraft:overworld positioned 7608 -64 7608 as @e[dx=2,dy=1,dz=2] run tp @s 7609 -62 7609

# Weather
    execute if predicate hvr:weather/is_raining run function hvr:world_manager/weather/rain/
    execute if predicate hvr:weather/is_lightning run function hvr:world_manager/weather/thunderstorm/

# Random phenomenon
    function hvr:world_manager/phenomenon/