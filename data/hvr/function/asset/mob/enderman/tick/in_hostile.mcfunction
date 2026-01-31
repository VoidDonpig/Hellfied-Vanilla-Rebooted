#> hvr:asset/mob/enderman/tick/in_hostile
#
# In hostile process
#
# @within function hvr:asset/mob/enderman/tick/

# Force destroy placeable vehiacle
    execute if predicate hvr:is_riding_placeable_vehicle on vehicle if entity @s[type=#hvr:placeable_vehicle] run function hvr:asset/mob/enderman/tick/destroy_vehicle