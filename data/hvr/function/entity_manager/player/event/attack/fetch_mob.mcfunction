#> hvr:entity_manager/player/event/attack/fetch_mob
#
# Call event
#
# @within function hvr:entity_manager/player/event/attack/filter/0

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
    execute if entity @p[tag=hvr.player_attacker,advancements={hvr:entity_manager/player/player_hurt_entity={type-melee=true}}] run data modify storage hvr:asset/context damage_type set value "is_melee"
    execute if entity @p[tag=hvr.player_attacker,advancements={hvr:entity_manager/player/player_hurt_entity={type-projectile=true}}] run data modify storage hvr:asset/context damage_type set value "is_projectile"
    execute if entity @p[tag=hvr.player_attacker,advancements={hvr:entity_manager/player/player_hurt_entity={type-explosion=true}}] run data modify storage hvr:asset/context damage_type set value "is_explosion"
    execute if entity @p[tag=hvr.player_attacker,advancements={hvr:entity_manager/player/player_hurt_entity={type-other=true}}] run data modify storage hvr:asset/context damage_type set value "is_other"

# Add attacker tag
    tag @p[tag=hvr.player_attacker] add hvr.attacker

# If asset, dispatch event
    execute if entity @s[tag=hvr.mob_asset] at @s run function hvr:entity_manager/mob/event/hurt/dispatch/

# Call storage again
    function hvr:entity_manager/storage/access

# Record current Health value
    # Victim
        data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].Health set from entity @s Health
        data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].AbsorptionAmount set from entity @s AbsorptionAmount

# Reset
    data remove storage hvr:asset/context damage
    data remove storage hvr:asset/context damage_type
    tag @n[type=#hvr:mob,tag=hvr.attacker] remove hvr.attacker
    scoreboard players reset $previous_health hvr.temporary
    scoreboard players reset $previous_absorption_amount hvr.temporary
    scoreboard players reset $current_health hvr.temporary
    scoreboard players reset $current_absorption_amount hvr.temporary
    scoreboard players reset $damage hvr.temporary