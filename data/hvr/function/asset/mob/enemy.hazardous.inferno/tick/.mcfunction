#> hvr:asset/mob/enemy.hazardous.inferno/tick/
#
# Tick process
#
# @within function hvr:entity_manager/mob/event/tick/dispatch/m

# SFX
    particle flame ~ ~0.6 ~ 0.3 0.6 0.3 0.08 1
    particle small_flame ~ ~0.6 ~ 0.4 0.8 0.4 0.04 1
    execute if entity @s[predicate=hvr:interval/100t,predicate=hvr:chance/0.5] anchored eyes positioned ^ ^ ^ run playsound entity.blaze.ambient hostile @a[distance=..16] ~ ~ ~ 1 0.65

# Remove water
    execute if function hvr:asset/mob/enemy.hazardous.inferno/tick/remove_water/check run function hvr:asset/mob/enemy.hazardous.inferno/tick/remove_water/

# Hostile tick
    execute if predicate hvr:in_hostile run function hvr:asset/mob/enemy.hazardous.inferno/tick/in_hostile