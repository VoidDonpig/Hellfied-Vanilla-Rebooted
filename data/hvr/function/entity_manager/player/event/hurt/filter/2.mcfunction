#> hvr:entity_manager/player/event/hurt/filter/2
#
# Filter attacker mob
#
# @within function hvr:entity_manager/player/event/hurt/filter/3

execute if entity @p[tag=hvr.player_victim,advancements={hvr:entity_manager/player/entity_hurt_player={2-0=true}}] if entity @s[tag=hvr.mob_id_bit_2.0] run function hvr:entity_manager/player/event/hurt/filter/1
execute if entity @p[tag=hvr.player_victim,advancements={hvr:entity_manager/player/entity_hurt_player={2-1=true}}] if entity @s[tag=hvr.mob_id_bit_2.1] run function hvr:entity_manager/player/event/hurt/filter/1