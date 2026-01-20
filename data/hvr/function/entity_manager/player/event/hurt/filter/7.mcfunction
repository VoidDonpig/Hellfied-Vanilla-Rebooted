#> hvr:entity_manager/player/event/hurt/filter/7
#
# Filter attacker mob
#
# @within function hvr:entity_manager/player/event/hurt/filter/8

execute if entity @p[tag=hvr.player_victim,advancements={hvr:entity_manager/player/entity_hurt_player={7-0=true}}] if entity @s[tag=hvr.mob_id_bit_7.0] run function hvr:entity_manager/player/event/hurt/filter/6
execute if entity @p[tag=hvr.player_victim,advancements={hvr:entity_manager/player/entity_hurt_player={7-1=true}}] if entity @s[tag=hvr.mob_id_bit_7.1] run function hvr:entity_manager/player/event/hurt/filter/6