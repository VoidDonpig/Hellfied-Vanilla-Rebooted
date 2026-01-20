#> hvr:entity_manager/player/event/attack/filter/8
#
# Filter attacked mob
#
# @within function hvr:entity_manager/player/event/attack/filter/9

execute if entity @p[tag=hvr.player_attacker,advancements={hvr:entity_manager/player/player_hurt_entity={8-0=true}}] if entity @s[tag=hvr.mob_id_bit_8.0] run function hvr:entity_manager/player/event/attack/filter/7
execute if entity @p[tag=hvr.player_attacker,advancements={hvr:entity_manager/player/player_hurt_entity={8-1=true}}] if entity @s[tag=hvr.mob_id_bit_8.1] run function hvr:entity_manager/player/event/attack/filter/7