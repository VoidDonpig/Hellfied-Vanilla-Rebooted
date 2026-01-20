#> hvr:world/tick
#
# World tick
#
# @within function hvr:core/tick/main

# Add shot tag projectile
    execute as @e[type=#hvr:projectiles,tag=!hvr.projectile_already_tick] run tag @s add hvr.projectile_already_tick

# Prevent invade unsafe area
    execute in minecraft:overworld positioned -1 -64 -1 as @e[dx=2,dy=1,dz=2] run tp @s 0 -62 0