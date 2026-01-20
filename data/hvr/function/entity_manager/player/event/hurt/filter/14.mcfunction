#> hvr:entity_manager/player/event/hurt/filter/14
#
# Filter attacker mob
#
# @within function hvr:entity_manager/player/event/hurt/filter/15

execute if entity @p[tag=hvr.player_victim,advancements={hvr:entity_manager/player/entity_hurt_player={14-0=true}}] if entity @s[tag=hvr.mob_id_bit_14.0] run function hvr:entity_manager/player/event/hurt/filter/13
execute if entity @p[tag=hvr.player_victim,advancements={hvr:entity_manager/player/entity_hurt_player={14-1=true}}] if entity @s[tag=hvr.mob_id_bit_14.1] run function hvr:entity_manager/player/event/hurt/filter/13