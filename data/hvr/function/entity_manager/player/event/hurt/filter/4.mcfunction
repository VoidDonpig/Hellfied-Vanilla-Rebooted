#> hvr:entity_manager/player/event/hurt/filter/4
#
# Filter attacker mob
#
# @within function hvr:entity_manager/player/event/hurt/filter/5

execute if entity @p[tag=hvr.player_victim,advancements={hvr:entity_manager/player/entity_hurt_player={4-0=true}}] if entity @s[tag=hvr.mob_id_bit_4.0] run function hvr:entity_manager/player/event/hurt/filter/3
execute if entity @p[tag=hvr.player_victim,advancements={hvr:entity_manager/player/entity_hurt_player={4-1=true}}] if entity @s[tag=hvr.mob_id_bit_4.1] run function hvr:entity_manager/player/event/hurt/filter/3