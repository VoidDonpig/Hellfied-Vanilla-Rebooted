#> hvr:asset/mob/skeleton/init
#
# Init process
#
# @within function hvr:entity_manager/mob/event/init/dispatch/dispatcher.m

# Equipment
    execute if score $difficulty hvr.global matches 1 run function hvr:asset/mob/skeleton/equipment/1