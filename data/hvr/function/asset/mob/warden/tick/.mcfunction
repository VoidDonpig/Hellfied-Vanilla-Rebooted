#> hvr:asset/mob/warden/tick/
#
# Tick process
#
# @within function hvr:entity_manager/mob/event/tick/dispatch/m

# In hostile tick
    execute if predicate hvr:in_hostile if data entity @s anger.suspects[0] run function hvr:asset/mob/warden/tick/in_hostile

# Give ruined miasma
    execute if predicate hvr:interval/20t as @e[type=#hvr:living,type=!warden,tag=!hvr.player_may_exception,tag=!hvr.no_process,distance=..64] run function hvr:asset/mob/warden/tick/give_ruined_miasma