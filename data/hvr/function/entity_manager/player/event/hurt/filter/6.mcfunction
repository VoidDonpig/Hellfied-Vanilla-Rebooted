#> hvr:entity_manager/player/event/hurt/filter/6
#
# Filter attacker mob
#
# @within function hvr:entity_manager/player/event/hurt/filter/7

execute if entity @p[tag=hvr.player_victim,advancements={hvr:entity_manager/player/entity_hurt_player={6-0=true}}] if entity @s[tag=hvr.mob_id_bit_6.0] run function hvr:entity_manager/player/event/hurt/filter/5
execute if entity @p[tag=hvr.player_victim,advancements={hvr:entity_manager/player/entity_hurt_player={6-1=true}}] if entity @s[tag=hvr.mob_id_bit_6.1] run function hvr:entity_manager/player/event/hurt/filter/5