#> hvr:entity_manager/player/event/attack/filter/15
#
# Filter attacked mob
#
# @within function hvr:entity_manager/player/event/attack/filter/start

execute if entity @p[tag=hvr.player_attacker,advancements={hvr:entity_manager/player/player_hurt_entity={15-0=true}}] if entity @s[tag=hvr.mob_id_bit_15.0] run function hvr:entity_manager/player/event/attack/filter/14
execute if entity @p[tag=hvr.player_attacker,advancements={hvr:entity_manager/player/player_hurt_entity={15-1=true}}] if entity @s[tag=hvr.mob_id_bit_15.1] run function hvr:entity_manager/player/event/attack/filter/14