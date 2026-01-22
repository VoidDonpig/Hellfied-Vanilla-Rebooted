#> hvr:entity_manager/mob/event/hurt/handler
#
# Hurt event handler
#
# @within function hvr:entity_manager/mob/event/hurt/damage_type/**

# Add victim tag
    tag @s add hvr.mob_victim

# Add tag for event dispatcher
    tag @n[type=#hvr:mob,tag=hvr.mob_attacker] add hvr.attacker
    tag @n[type=#hvr:projectiles,tag=hvr.mob_damaging_projectile] add hvr.damaging_projectile
    tag @s add hvr.victim
    execute if entity @s[nbt={Health:0f}] run tag @s add hvr.killed
    execute if entity @s[tag=hvr.killed] run tag @s add hvr.death
    execute if entity @s[tag=hvr.killed] run tag @n[tag=hvr.mob_attacker] add hvr.killer

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
    data modify storage hvr:asset/context damage_type set from storage hvr:entity_manager/mob damage_type

# If asset, dispatch event
    execute as @n[type=#hvr:mob,tag=hvr.mob_attacker,tag=hvr.mob_asset] at @s run function hvr:entity_manager/mob/event/attack/dispatch/get_data_and_call
    execute as @n[type=#hvr:mob,tag=hvr.mob_killer,tag=hvr.mob_asset] at @s run function hvr:entity_manager/mob/event/kill/dispatch/get_data_and_call
    execute if entity @s[tag=hvr.mob_asset,tag=!hvr.killed] run function hvr:entity_manager/mob/event/hurt/dispatch/get_data_and_call
    execute if entity @s[tag=hvr.mob_asset,tag=hvr.killed] run function hvr:entity_manager/mob/event/killed/dispatch/get_data_and_call

# Call storage again
    function hvr:entity_manager/storage/access

# Record current Health value
    # Victim
        data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].Health set from entity @s Health
        data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].AbsorptionAmount set from entity @s AbsorptionAmount
    # Attacker
        # Call storage
            execute as @n[tag=hvr.mob_attacker] run function hvr:entity_manager/storage/access
        data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].Health set from entity @s Health
        data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].AbsorptionAmount set from entity @s AbsorptionAmount

# Reset
    data remove storage hvr:entity_manager/mob damage_type
    data remove storage hvr:asset/context damage
    data remove storage hvr:asset/context damage_type
    tag @n[type=#hvr:mob,tag=hvr.mob_attacker] remove hvr.mob_attacker
    tag @n[type=#hvr:projectiles,tag=hvr.mob_damaging_projectile] remove hvr.mob_damaging_projectile
    tag @s remove hvr.mob_victim
    tag @n[type=#hvr:mob,tag=hvr.attacker] remove hvr.attacker
    tag @n[type=#hvr:mob,tag=hvr.killer] remove hvr.killer
    tag @n[type=#hvr:projectiles,tag=hvr.damaging_projectile] remove hvr.damaging_projectile
    tag @s remove hvr.victim
    scoreboard players reset $previous_health hvr.temporary
    scoreboard players reset $previous_absorption_amount hvr.temporary
    scoreboard players reset $current_health hvr.temporary
    scoreboard players reset $current_absorption_amount hvr.temporary
    scoreboard players reset $damage hvr.temporary