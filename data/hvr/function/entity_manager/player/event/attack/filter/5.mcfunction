#> hvr:entity_manager/player/event/attack/filter/5
#
# Filter attacked mob
#
# @within function hvr:entity_manager/player/event/attack/filter/6

execute if entity @p[tag=hvr.player_attacker,advancements={hvr:entity_manager/player/player_hurt_entity={5-0=true}}] if entity @s[tag=hvr.mob_id_bit_5.0] run function hvr:entity_manager/player/event/attack/filter/4
execute if entity @p[tag=hvr.player_attacker,advancements={hvr:entity_manager/player/player_hurt_entity={5-1=true}}] if entity @s[tag=hvr.mob_id_bit_5.1] run function hvr:entity_manager/player/event/attack/filter/4