#> hvr:entity_manager/player/event/hurt/filter/8
#
# Filter attacker mob
#
# @within function hvr:entity_manager/player/event/hurt/filter/9

execute if entity @p[tag=hvr.player_victim,advancements={hvr:entity_manager/player/entity_hurt_player={8-0=true}}] if entity @s[tag=hvr.mob_id_bit_8.0] run function hvr:entity_manager/player/event/hurt/filter/7
execute if entity @p[tag=hvr.player_victim,advancements={hvr:entity_manager/player/entity_hurt_player={8-1=true}}] if entity @s[tag=hvr.mob_id_bit_8.1] run function hvr:entity_manager/player/event/hurt/filter/7