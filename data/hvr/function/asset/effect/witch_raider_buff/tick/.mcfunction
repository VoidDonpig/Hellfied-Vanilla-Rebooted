#> hvr:asset/effect/witch_raider_buff/tick/
#
# Tick event process
#
# @within function hvr:entity_manager/effect/event/tick/dispatch/m

# SFX
    execute anchored eyes positioned ^ ^ ^ run particle trial_spawner_detection_ominous ~ ~ ~ 0.3 0.3 0.3 0 1
    execute if entity @s[predicate=hvr:chance/0.1] anchored eyes positioned ^ ^ ^ run particle witch ~ ~ ~ 0.15 0.15 0.15 0 1
    
    execute if entity @s[type=pillager,predicate=hvr:interval/80t,predicate=hvr:chance/0.5] anchored eyes positioned ^ ^ ^ run playsound entity.pillager.celebrate hostile @a[distance=..16] ~ ~ ~ 1 0.7
    execute if entity @s[type=vindicator,predicate=hvr:interval/80t,predicate=hvr:chance/0.5] anchored eyes positioned ^ ^ ^ run playsound entity.vindicator.celebrate hostile @a[distance=..16] ~ ~ ~ 1 0.7
    execute if entity @s[type=evoker,predicate=hvr:interval/80t,predicate=hvr:chance/0.5] anchored eyes positioned ^ ^ ^ run playsound entity.evoker.celebrate hostile @a[distance=..16] ~ ~ ~ 1 0.7
    execute if entity @s[type=witch,predicate=hvr:interval/80t,predicate=hvr:chance/0.5] anchored eyes positioned ^ ^ ^ run playsound entity.witch.celebrate hostile @a[distance=..16] ~ ~ ~ 1 0.7
    execute if entity @s[type=illusioner,predicate=hvr:interval/80t,predicate=hvr:chance/0.5] anchored eyes positioned ^ ^ ^ run playsound entity.illusioner.ambient hostile @a[distance=..16] ~ ~ ~ 1 0.7