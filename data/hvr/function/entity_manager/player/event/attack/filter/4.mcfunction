#> hvr:entity_manager/player/event/attack/filter/4
#
# Filter attacked mob
#
# @within function hvr:entity_manager/player/event/attack/filter/5

execute if entity @p[tag=hvr.player_attacker,advancements={hvr:entity_manager/player/player_hurt_entity={4-0=true}}] if entity @s[tag=hvr.mob_id_bit_4.0] run function hvr:entity_manager/player/event/attack/filter/3
execute if entity @p[tag=hvr.player_attacker,advancements={hvr:entity_manager/player/player_hurt_entity={4-1=true}}] if entity @s[tag=hvr.mob_id_bit_4.1] run function hvr:entity_manager/player/event/attack/filter/3