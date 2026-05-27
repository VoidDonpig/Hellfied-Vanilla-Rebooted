#> hvr:core/tick/mob/post
#
# Mob post tick
#
# @within function hvr:core/tick/main

# When convert, init again as new natural mob
    execute if entity @s[type=#hvr:may_be_converted] unless score @s hvr.mob_id matches 1.. run function hvr:entity_manager/mob/init/converted_mob

# Call storage
    function hvr:api/storage/entity/fetch

# Record current Health value
    data modify storage hvr:entity_manager/storage fetched.Health set from entity @s Health
    data modify storage hvr:entity_manager/storage fetched.AbsorptionAmount set from entity @s AbsorptionAmount