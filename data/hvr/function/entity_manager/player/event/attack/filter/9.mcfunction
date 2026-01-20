#> hvr:entity_manager/player/event/attack/filter/9
#
# Filter attacked mob
#
# @within function hvr:entity_manager/player/event/attack/filter/10

execute if entity @p[tag=hvr.player_attacker,advancements={hvr:entity_manager/player/player_hurt_entity={9-0=true}}] if entity @s[tag=hvr.mob_id_bit_9.0] run function hvr:entity_manager/player/event/attack/filter/8
execute if entity @p[tag=hvr.player_attacker,advancements={hvr:entity_manager/player/player_hurt_entity={9-1=true}}] if entity @s[tag=hvr.mob_id_bit_9.1] run function hvr:entity_manager/player/event/attack/filter/8