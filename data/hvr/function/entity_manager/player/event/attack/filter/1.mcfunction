#> hvr:entity_manager/player/event/attack/filter/1
#
# Filter attacked mob
#
# @within function hvr:entity_manager/player/event/attack/filter/2

execute if entity @p[tag=hvr.player_attacker,advancements={hvr:entity_manager/player/player_hurt_entity={1-0=true}}] if entity @s[tag=hvr.mob_id_bit_1.0] run function hvr:entity_manager/player/event/attack/filter/0
execute if entity @p[tag=hvr.player_attacker,advancements={hvr:entity_manager/player/player_hurt_entity={1-1=true}}] if entity @s[tag=hvr.mob_id_bit_1.1] run function hvr:entity_manager/player/event/attack/filter/0