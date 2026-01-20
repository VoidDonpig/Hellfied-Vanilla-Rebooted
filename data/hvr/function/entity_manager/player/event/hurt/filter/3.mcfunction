#> hvr:entity_manager/player/event/hurt/filter/3
#
# Filter attacker mob
#
# @within function hvr:entity_manager/player/event/hurt/filter/4

execute if entity @p[tag=hvr.player_victim,advancements={hvr:entity_manager/player/entity_hurt_player={3-0=true}}] if entity @s[tag=hvr.mob_id_bit_3.0] run function hvr:entity_manager/player/event/hurt/filter/2
execute if entity @p[tag=hvr.player_victim,advancements={hvr:entity_manager/player/entity_hurt_player={3-1=true}}] if entity @s[tag=hvr.mob_id_bit_3.1] run function hvr:entity_manager/player/event/hurt/filter/2