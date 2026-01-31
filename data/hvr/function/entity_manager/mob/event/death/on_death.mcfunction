#> hvr:entity_manager/mob/event/death/on_death
#
# Fetch died mob (except player)
#
# @within enchantment hvr:entity_manager/mob/sys

# If ticks_since_last_hurt_by_mob == 100, this mob may be killed by player
    tag @s[nbt={last_hurt_by_player_memory_time:100}] add hvr.killed

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

# Add tag to killer
    execute if entity @s[tag=hvr.killed] on attacker if entity @s[type=player] run tag @s add hvr.killer

# Dispatch event
    execute if entity @s[tag=hvr.mob_asset,tag=!hvr.killed] run function hvr:entity_manager/mob/event/death/dispatch/
    execute if entity @s[tag=hvr.mob_asset,tag=hvr.killed] run function hvr:entity_manager/mob/event/killed/dispatch/

# Add death tag
    tag @s add hvr.death

# Reset
    data remove storage hvr:asset/context damage
    tag @p[tag=hvr.killer] remove hvr.killer
    scoreboard players reset $previous_health hvr.temporary
    scoreboard players reset $previous_absorption_amount hvr.temporary
    scoreboard players reset $current_health hvr.temporary
    scoreboard players reset $current_absorption_amount hvr.temporary
    scoreboard players reset $damage hvr.temporary