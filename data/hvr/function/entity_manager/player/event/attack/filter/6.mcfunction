#> hvr:entity_manager/player/event/attack/filter/6
#
# Filter attacked mob
#
# @within function hvr:entity_manager/player/event/attack/filter/7

execute if entity @p[tag=hvr.player_attacker,advancements={hvr:entity_manager/player/player_hurt_entity={6-0=true}}] if entity @s[tag=hvr.mob_id_bit_6.0] run function hvr:entity_manager/player/event/attack/filter/5
execute if entity @p[tag=hvr.player_attacker,advancements={hvr:entity_manager/player/player_hurt_entity={6-1=true}}] if entity @s[tag=hvr.mob_id_bit_6.1] run function hvr:entity_manager/player/event/attack/filter/5