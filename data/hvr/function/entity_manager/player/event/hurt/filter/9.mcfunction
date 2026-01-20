#> hvr:entity_manager/player/event/hurt/filter/9
#
# Filter attacker mob
#
# @within function hvr:entity_manager/player/event/hurt/filter/10

execute if entity @p[tag=hvr.player_victim,advancements={hvr:entity_manager/player/entity_hurt_player={9-0=true}}] if entity @s[tag=hvr.mob_id_bit_9.0] run function hvr:entity_manager/player/event/hurt/filter/8
execute if entity @p[tag=hvr.player_victim,advancements={hvr:entity_manager/player/entity_hurt_player={9-1=true}}] if entity @s[tag=hvr.mob_id_bit_9.1] run function hvr:entity_manager/player/event/hurt/filter/8