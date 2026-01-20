#> hvr:entity_manager/player/event/attack/filter/10
#
# Filter attacked mob
#
# @within function hvr:entity_manager/player/event/attack/filter/11

execute if entity @p[tag=hvr.player_attacker,advancements={hvr:entity_manager/player/player_hurt_entity={10-0=true}}] if entity @s[tag=hvr.mob_id_bit_10.0] run function hvr:entity_manager/player/event/attack/filter/9
execute if entity @p[tag=hvr.player_attacker,advancements={hvr:entity_manager/player/player_hurt_entity={10-1=true}}] if entity @s[tag=hvr.mob_id_bit_10.1] run function hvr:entity_manager/player/event/attack/filter/9