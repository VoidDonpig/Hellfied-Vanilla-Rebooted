#> hvr:entity_manager/player/event/attack/filter/12
#
# Filter attacked mob
#
# @within function hvr:entity_manager/player/event/attack/filter/13

execute if entity @p[tag=hvr.player_attacker,advancements={hvr:entity_manager/player/player_hurt_entity={12-0=true}}] if entity @s[tag=hvr.mob_id_bit_12.0] run function hvr:entity_manager/player/event/attack/filter/11
execute if entity @p[tag=hvr.player_attacker,advancements={hvr:entity_manager/player/player_hurt_entity={12-1=true}}] if entity @s[tag=hvr.mob_id_bit_12.1] run function hvr:entity_manager/player/event/attack/filter/11