#> hvr:asset/effect/ominous_bloodlust/remove/
#
# Remove event process
#
# @within
#   function hvr:entity_manager/effect/event/remove/dispatch/m
#   hvr:asset/effect/ominous_bloodlust/end/

# Remove attribute
    attribute @s max_health modifier remove hvr:asset/effect/ominous_bloodlust.max_health
    attribute @s armor modifier remove hvr:asset/effect/ominous_bloodlust.armor
    attribute @s armor_toughness modifier remove hvr:asset/effect/ominous_bloodlust.armor_toughness
    attribute @s attack_damage modifier remove hvr:asset/effect/ominous_bloodlust.attack_damage
    attribute @s movement_speed modifier remove hvr:asset/effect/ominous_bloodlust.movement_speed

# SFX
    execute anchored eyes positioned ^ ^ ^ run playsound block.fire.extinguish hostile @a[distance=..32] ~ ~ ~ 2 0.5
    execute anchored eyes positioned ^ ^ ^ run playsound block.trial_spawner.ambient_ominous hostile @a[distance=..16] ~ ~ ~ 1 0.7
    execute anchored eyes positioned ^ ^ ^ run particle smoke ~ ~ ~ 0.3 0.3 0.3 0.08 32