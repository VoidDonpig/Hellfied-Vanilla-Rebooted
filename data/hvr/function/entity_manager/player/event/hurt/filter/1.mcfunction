#> hvr:entity_manager/player/event/hurt/filter/1
#
# Filter attacker mob
#
# @within function hvr:entity_manager/player/event/hurt/filter/2

execute if entity @p[tag=hvr.player_victim,advancements={hvr:entity_manager/player/entity_hurt_player={1-0=true}}] if entity @s[tag=hvr.mob_id_bit_1.0] run function hvr:entity_manager/player/event/hurt/filter/0
execute if entity @p[tag=hvr.player_victim,advancements={hvr:entity_manager/player/entity_hurt_player={1-1=true}}] if entity @s[tag=hvr.mob_id_bit_1.1] run function hvr:entity_manager/player/event/hurt/filter/0