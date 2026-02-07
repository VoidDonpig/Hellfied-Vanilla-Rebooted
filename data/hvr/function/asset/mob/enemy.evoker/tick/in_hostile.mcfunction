#> hvr:asset/mob/enemy.evoker/tick/in_hostile
#
# Hostile tick
#
# @within function hvr:asset/mob/enemy.evoker/tick/

# Aura farming lmao (aura SFX)
    function hvr:asset/mob/enemy.evoker/tick/aura_particle/

# Anti projectiles
    execute anchored eyes positioned ^ ^ ^ as @e[type=#hvr:projectiles,tag=!hvr.asset.mob.evoker_already_passed_projectile,distance=..4] run function hvr:asset/mob/enemy.evoker/tick/anti_projectile/check