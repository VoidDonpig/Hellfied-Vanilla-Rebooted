#> hvr:asset/effect/in_flame/remove/
#
# Remove event process
#
# @within function
#   hvr:entity_manager/effect/event/remove/dispatch/m
#   hvr:asset/effect/in_flame/end/

# Remove attribute
    attribute @s attack_damage modifier remove hvr:asset/effect/in_flame.attack_damage

# SFX
    execute anchored eyes positioned ^ ^ ^ run playsound entity.generic.extinguish_fire hostile @a[distance=..24] ~ ~ ~ 1.5 0.7
    execute anchored eyes positioned ^ ^ ^ run particle smoke ~ ~ ~ 0.3 0.4 0.3 0 32