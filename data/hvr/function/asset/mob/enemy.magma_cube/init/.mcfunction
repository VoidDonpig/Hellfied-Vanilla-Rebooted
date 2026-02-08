#> hvr:asset/mob/enemy.magma_cube/init/
#
# Init process
#
# @within function hvr:entity_manager/mob/event/init/dispatch/m

# If first init, scale
    execute if entity @s[tag=!hvr.asset.mob.enemy.magma_cube_first_init_done] run function hvr:asset/mob/enemy.magma_cube/init/first_init