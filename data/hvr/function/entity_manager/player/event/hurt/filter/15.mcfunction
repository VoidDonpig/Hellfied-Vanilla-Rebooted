#> hvr:entity_manager/player/event/hurt/filter/15
#
# Filter attacker mob
#
# @within function hvr:entity_manager/player/event/hurt/filter/start

execute if entity @p[tag=hvr.player_victim,advancements={hvr:entity_manager/player/entity_hurt_player={15-0=true}}] if entity @s[tag=hvr.mob_id_bit_15.0] run function hvr:entity_manager/player/event/hurt/filter/14
execute if entity @p[tag=hvr.player_victim,advancements={hvr:entity_manager/player/entity_hurt_player={15-1=true}}] if entity @s[tag=hvr.mob_id_bit_15.1] run function hvr:entity_manager/player/event/hurt/filter/14