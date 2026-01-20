#> hvr:entity_manager/player/event/hurt/filter/5
#
# Filter attacker mob
#
# @within function hvr:entity_manager/player/event/hurt/filter/6

execute if entity @p[tag=hvr.player_victim,advancements={hvr:entity_manager/player/entity_hurt_player={5-0=true}}] if entity @s[tag=hvr.mob_id_bit_5.0] run function hvr:entity_manager/player/event/hurt/filter/4
execute if entity @p[tag=hvr.player_victim,advancements={hvr:entity_manager/player/entity_hurt_player={5-1=true}}] if entity @s[tag=hvr.mob_id_bit_5.1] run function hvr:entity_manager/player/event/hurt/filter/4