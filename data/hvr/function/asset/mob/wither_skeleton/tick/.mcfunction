#> hvr:asset/mob/wither_skeleton/tick/
#
# Tick process
#
# @within function hvr:entity_manager/mob/event/tick/dispatch/m

# When in hostile
    execute if predicate hvr:in_hostile run function hvr:asset/mob/wither_skeleton/tick/in_hostile

# Rotate display
    execute on passengers rotated as @n[type=wither_skeleton,tag=hvr.this] run rotate @s ~ 0