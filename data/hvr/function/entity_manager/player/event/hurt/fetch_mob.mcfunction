#> hvr:entity_manager/player/event/hurt/fetch_mob
#
# Call event
#
# @within function hvr:entity_manager/player/event/hurt/filter/0
    
# Call storage
    function hvr:entity_manager/storage/access

# Calculate damage value
    scoreboard players set $damage hvr.temporary 0
    scoreboard players operation $damage hvr.temporary += @p[tag=hvr.player_victim] hvr.player_taken_damage
    scoreboard players operation $damage hvr.temporary += @p[tag=hvr.player_victim] hvr.player_absorbed_damage

# Set context
    execute store result storage hvr:asset/context damage double 0.1 run scoreboard players get $damage hvr.temporary
    execute if entity @p[tag=hvr.player_victim,advancements={hvr:entity_manager/player/entity_hurt_player={type-melee=true}}] run data modify storage hvr:asset/context damage_type set value "is_melee"
    execute if entity @p[tag=hvr.player_victim,advancements={hvr:entity_manager/player/entity_hurt_player={type-projectile=true}}] run data modify storage hvr:asset/context damage_type set value "is_projectile"
    execute if entity @p[tag=hvr.player_victim,advancements={hvr:entity_manager/player/entity_hurt_player={type-explosion=true}}] run data modify storage hvr:asset/context damage_type set value "is_explosion"
    execute if entity @p[tag=hvr.player_victim,advancements={hvr:entity_manager/player/entity_hurt_player={type-other=true}}] run data modify storage hvr:asset/context damage_type set value "is_other"

# Add victim tag
    tag @p[tag=hvr.player_victim] add hvr.victim
    tag @p[tag=hvr.player_killed] add hvr.killed

# If asset, dispatch event
    execute if entity @s[tag=hvr.mob_asset] at @s run function hvr:entity_manager/mob/event/attack/dispatch/
    execute if entity @s[tag=hvr.mob_asset] if entity @p[tag=hvr.player_killed] at @s run function hvr:entity_manager/mob/event/kill/dispatch/

# Call storage again
    function hvr:entity_manager/storage/access

# Record current Health value
    # Attacker
        data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].Health set from entity @s Health
        data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].AbsorptionAmount set from entity @s AbsorptionAmount

# Reset
    data remove storage hvr:asset/context damage
    data remove storage hvr:asset/context damage_type
    tag @p[tag=hvr.victim] remove hvr.victim
    tag @p[tag=hvr.killed] remove hvr.killed
    scoreboard players reset $damage hvr.temporary
    scoreboard players reset @p[tag=hvr.player_victim] hvr.player_taken_damage
    scoreboard players reset @p[tag=hvr.player_victim] hvr.player_absorbed_damage