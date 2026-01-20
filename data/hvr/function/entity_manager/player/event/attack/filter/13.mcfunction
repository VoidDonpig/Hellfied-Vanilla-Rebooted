#> hvr:entity_manager/player/event/attack/filter/13
#
# Filter attacked mob
#
# @within function hvr:entity_manager/player/event/attack/filter/14

execute if entity @p[tag=hvr.player_attacker,advancements={hvr:entity_manager/player/player_hurt_entity={13-0=true}}] if entity @s[tag=hvr.mob_id_bit_13.0] run function hvr:entity_manager/player/event/attack/filter/12
execute if entity @p[tag=hvr.player_attacker,advancements={hvr:entity_manager/player/player_hurt_entity={13-1=true}}] if entity @s[tag=hvr.mob_id_bit_13.1] run function hvr:entity_manager/player/event/attack/filter/12