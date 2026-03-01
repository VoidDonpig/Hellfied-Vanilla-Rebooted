#> hvr:entity_manager/mob/event/damaged/on_damaged
#
# Damaged event handler
#
# @within enchantment hvr:entity_manager/mob/sys

# Call storage
    function hvr:entity_manager/storage/access

# Calculate damage value
    execute store result score $previous_health hvr.temporary run data get storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].Health 100
    execute store result score $previous_absorption_amount hvr.temporary run data get storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].AbsorptionAmount 100
    execute store result score $current_health hvr.temporary run data get entity @s Health 100
    execute store result score $current_absorption_amount hvr.temporary run data get entity @s AbsorptionAmount 100
    scoreboard players set $damage hvr.temporary 0
    scoreboard players operation $damage hvr.temporary += $previous_health hvr.temporary
    scoreboard players operation $damage hvr.temporary += $previous_absorption_amount hvr.temporary
    scoreboard players operation $damage hvr.temporary -= $current_health hvr.temporary
    scoreboard players operation $damage hvr.temporary -= $current_absorption_amount hvr.temporary

# Set context
    execute store result storage hvr:asset/context damage double 0.01 run scoreboard players get $damage hvr.temporary

# If asset, dispatch event
    execute as @n[type=#hvr:mob,tag=hvr.asset.mob,tag=!hvr.hurt] at @s run function hvr:entity_manager/mob/event/damaged/dispatch/

# Call storage again
    function hvr:entity_manager/storage/access

# Record current Health value
    data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].Health set from entity @s Health
    data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].AbsorptionAmount set from entity @s AbsorptionAmount

# Remove hurt tag
    tag @s remove hvr.hurt

# Reset
    data remove storage hvr:asset/context damage
    scoreboard players reset $previous_health hvr.temporary
    scoreboard players reset $previous_absorption_amount hvr.temporary
    scoreboard players reset $current_health hvr.temporary
    scoreboard players reset $current_absorption_amount hvr.temporary
    scoreboard players reset $damage hvr.temporary