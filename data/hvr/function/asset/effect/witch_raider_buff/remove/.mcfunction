#> hvr:asset/effect/witch_raider_buff/remove/
#
# Remove event process
#
# @within
#   function hvr:entity_manager/effect/event/remove/dispatch/m
#   hvr:asset/effect/witch_raider_buff/end/

# Remove attribute
    attribute @s max_health modifier remove hvr:asset/effect/witch_raider_buff.max_health
    attribute @s armor modifier remove hvr:asset/effect/witch_raider_buff.armor
    attribute @s armor_toughness modifier remove hvr:asset/effect/witch_raider_buff.armor_toughness
    attribute @s attack_damage modifier remove hvr:asset/effect/witch_raider_buff.attack_damage
    attribute @s movement_speed modifier remove hvr:asset/effect/witch_raider_buff.movement_speed

# SFX
    execute anchored eyes positioned ^ ^ ^ run playsound item.shield.break hostile @a[distance=..32] ~ ~ ~ 2 0.5
    execute anchored eyes positioned ^ ^ ^ run playsound block.glass.break hostile @a[distance=..24] ~ ~ ~ 1.5 0.75
    execute anchored eyes positioned ^ ^ ^ run particle block{block_state:"purple_stained_glass"} ~ ~ ~ 0.3 0.4 0.3 0 32