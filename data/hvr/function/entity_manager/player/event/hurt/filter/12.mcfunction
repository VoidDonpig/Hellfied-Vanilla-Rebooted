#> hvr:entity_manager/player/event/hurt/filter/12
#
# Filter attacker mob
#
# @within function hvr:entity_manager/player/event/hurt/filter/11

execute if entity @p[tag=hvr.player_victim,advancements={hvr:entity_manager/player/entity_hurt_player={12-0=true}}] if entity @s[tag=hvr.mob_id_bit_12.0] run function hvr:entity_manager/player/event/hurt/filter/11
execute if entity @p[tag=hvr.player_victim,advancements={hvr:entity_manager/player/entity_hurt_player={12-1=true}}] if entity @s[tag=hvr.mob_id_bit_12.1] run function hvr:entity_manager/player/event/hurt/filter/11