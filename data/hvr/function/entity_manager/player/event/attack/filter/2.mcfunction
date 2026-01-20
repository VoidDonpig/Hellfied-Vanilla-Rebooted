#> hvr:entity_manager/player/event/attack/filter/2
#
# Filter attacked mob
#
# @within function hvr:entity_manager/player/event/attack/filter/3

execute if entity @p[tag=hvr.player_attacker,advancements={hvr:entity_manager/player/player_hurt_entity={2-0=true}}] if entity @s[tag=hvr.mob_id_bit_2.0] run function hvr:entity_manager/player/event/attack/filter/1
execute if entity @p[tag=hvr.player_attacker,advancements={hvr:entity_manager/player/player_hurt_entity={2-1=true}}] if entity @s[tag=hvr.mob_id_bit_2.1] run function hvr:entity_manager/player/event/attack/filter/1