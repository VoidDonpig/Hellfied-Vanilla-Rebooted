#> hvr:asset/mob/enemy.hazardous.inferno/tick/in_hostile
#
# Hostile tick
#
# @within function hvr:asset/mob/enemy.hazardous.inferno/tick/

#> Private
# @private
#declare score_holder $remaining_actions

# Add timer
    scoreboard players add @s hvr.asset.generic 1

# Explosive fireball
    execute anchored eyes positioned ^ ^ ^ as @e[type=small_fireball,tag=!hvr.projectile_ticked,distance=..2] at @s run function hvr:asset/mob/enemy.blaze/tick/explosive_fireball/search

# Rapid Fire
    execute unless score @s hvr.asset.mob.enemy.hazardous.inferno.action_count matches 3 if entity @s[predicate=hvr:interval/10t] anchored eyes positioned ^ ^ ^ run function hvr:asset/mob/enemy.hazardous.inferno/tick/rapid_fire/

# Fire Wave
    execute if score @s hvr.asset.generic matches 160..200 anchored eyes positioned ^ ^ ^ run function hvr:asset/mob/enemy.hazardous.inferno/tick/fire_wave/

# Add action count
    execute if score @s hvr.asset.generic matches 200 run scoreboard players add @s hvr.asset.mob.enemy.hazardous.inferno.action_count 1

# Infernal Healing
    execute if score @s hvr.asset.mob.enemy.hazardous.inferno.action_count matches 1 if score @s hvr.asset.generic matches 200 run function hvr:asset/mob/enemy.hazardous.inferno/tick/infernal_healing/

# Lava Lay
    # Prediction
        execute if score @s hvr.asset.mob.enemy.hazardous.inferno.action_count matches 2 if score @s hvr.asset.generic matches 200..239 run function hvr:asset/mob/enemy.hazardous.inferno/tick/lava_lay/predict/
    # Run
        execute if score @s hvr.asset.mob.enemy.hazardous.inferno.action_count matches 2 if score @s hvr.asset.generic matches 240 run function hvr:asset/mob/enemy.hazardous.inferno/tick/lava_lay/

# Demolished Flame
    # Prepare
        execute if score @s hvr.asset.mob.enemy.hazardous.inferno.action_count matches 3 if score @s hvr.asset.generic matches 200..259 anchored eyes positioned ^ ^ ^ run function hvr:asset/mob/enemy.hazardous.inferno/tick/demolished_flame/prepare
    # Run
        execute if score @s hvr.asset.mob.enemy.hazardous.inferno.action_count matches 3 if score @s hvr.asset.generic matches 260 run function hvr:asset/mob/enemy.hazardous.inferno/tick/demolished_flame/


# Reset
    scoreboard players reset @s[scores={hvr.asset.mob.enemy.hazardous.inferno.action_count=3,hvr.asset.generic=260..}] hvr.asset.mob.enemy.hazardous.inferno.action_count
    scoreboard players reset @s[scores={hvr.asset.generic=260..}] hvr.asset.generic