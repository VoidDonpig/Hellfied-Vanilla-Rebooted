#> hvr:asset/effect/in_flame/tick/
#
# Tick event process
#
# @within function hvr:entity_manager/effect/event/tick/dispatch/m

# SFX
    execute anchored eyes positioned ^ ^ ^ run particle flame ~ ~ ~ 0.25 0.55 0.25 0.04 2

# Damage
    execute if predicate hvr:interval/10t run damage @s 2 in_fire

# If in water, remove effect
    execute if predicate hvr:is_in_water run data modify storage hvr:asset/context duration set value 0