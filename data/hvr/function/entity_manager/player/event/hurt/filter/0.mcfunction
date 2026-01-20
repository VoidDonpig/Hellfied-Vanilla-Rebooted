#> hvr:entity_manager/player/event/hurt/filter/0
#
# Filter attacker mob
#
# @within function hvr:entity_manager/player/event/hurt/filter/1

execute if entity @p[tag=hvr.player_victim,advancements={hvr:entity_manager/player/entity_hurt_player={0-0=true}}] if entity @s[tag=hvr.mob_id_bit_0.0] run function hvr:entity_manager/player/event/hurt/fetch_mob
execute if entity @p[tag=hvr.player_victim,advancements={hvr:entity_manager/player/entity_hurt_player={0-1=true}}] if entity @s[tag=hvr.mob_id_bit_0.1] run function hvr:entity_manager/player/event/hurt/fetch_mob