#> hvr:entity_manager/player/event/attack/filter/14
#
# Filter attacked mob
#
# @within function hvr:entity_manager/player/event/attack/filter/15

execute if entity @p[tag=hvr.player_attacker,advancements={hvr:entity_manager/player/player_hurt_entity={14-0=true}}] if entity @s[tag=hvr.mob_id_bit_14.0] run function hvr:entity_manager/player/event/attack/filter/13
execute if entity @p[tag=hvr.player_attacker,advancements={hvr:entity_manager/player/player_hurt_entity={14-1=true}}] if entity @s[tag=hvr.mob_id_bit_14.1] run function hvr:entity_manager/player/event/attack/filter/13