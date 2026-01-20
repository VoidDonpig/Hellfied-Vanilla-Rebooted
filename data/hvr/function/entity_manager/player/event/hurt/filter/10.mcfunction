#> hvr:entity_manager/player/event/hurt/filter/10
#
# Filter attacker mob
#
# @within function hvr:entity_manager/player/event/hurt/filter/11

execute if entity @p[tag=hvr.player_victim,advancements={hvr:entity_manager/player/entity_hurt_player={10-0=true}}] if entity @s[tag=hvr.mob_id_bit_10.0] run function hvr:entity_manager/player/event/hurt/filter/9
execute if entity @p[tag=hvr.player_victim,advancements={hvr:entity_manager/player/entity_hurt_player={10-1=true}}] if entity @s[tag=hvr.mob_id_bit_10.1] run function hvr:entity_manager/player/event/hurt/filter/9