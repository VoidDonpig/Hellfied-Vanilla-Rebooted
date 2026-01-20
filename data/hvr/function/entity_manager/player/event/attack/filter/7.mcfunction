#> hvr:entity_manager/player/event/attack/filter/7
#
# Filter attacked mob
#
# @within function hvr:entity_manager/player/event/attack/filter/8

execute if entity @p[tag=hvr.player_attacker,advancements={hvr:entity_manager/player/player_hurt_entity={7-0=true}}] if entity @s[tag=hvr.mob_id_bit_7.0] run function hvr:entity_manager/player/event/attack/filter/6
execute if entity @p[tag=hvr.player_attacker,advancements={hvr:entity_manager/player/player_hurt_entity={7-1=true}}] if entity @s[tag=hvr.mob_id_bit_7.1] run function hvr:entity_manager/player/event/attack/filter/6