#> hvr:entity_manager/player/event/attack/filter/11
#
# Filter attacked mob
#
# @within function hvr:entity_manager/player/event/attack/filter/12

execute if entity @p[tag=hvr.player_attacker,advancements={hvr:entity_manager/player/player_hurt_entity={11-0=true}}] if entity @s[tag=hvr.mob_id_bit_11.0] run function hvr:entity_manager/player/event/attack/filter/10
execute if entity @p[tag=hvr.player_attacker,advancements={hvr:entity_manager/player/player_hurt_entity={11-1=true}}] if entity @s[tag=hvr.mob_id_bit_11.1] run function hvr:entity_manager/player/event/attack/filter/10