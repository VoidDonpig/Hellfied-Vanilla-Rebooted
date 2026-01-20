#> hvr:entity_manager/player/event/attack/filter/3
#
# Filter attacked mob
#
# @within function hvr:entity_manager/player/event/attack/filter/4

execute if entity @p[tag=hvr.player_attacker,advancements={hvr:entity_manager/player/player_hurt_entity={3-0=true}}] if entity @s[tag=hvr.mob_id_bit_3.0] run function hvr:entity_manager/player/event/attack/filter/2
execute if entity @p[tag=hvr.player_attacker,advancements={hvr:entity_manager/player/player_hurt_entity={3-1=true}}] if entity @s[tag=hvr.mob_id_bit_3.1] run function hvr:entity_manager/player/event/attack/filter/2