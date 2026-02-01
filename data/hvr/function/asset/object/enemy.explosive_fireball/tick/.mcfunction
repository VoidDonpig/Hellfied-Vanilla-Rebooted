#> hvr:asset/object/enemy.explosive_fireball/tick/
#
# Tick process
#
# @within function hvr:entity_manager/object/event/tick/dispatch/m

# SFX
    particle flame ~ ~ ~ 0.3 0.3 0.3 0.01 2
    particle large_smoke ~ ~ ~ 0.3 0.3 0.3 0.01 1
    particle dust_color_transition{from_color:[1.000,0.352,0.122],to_color:[0.431,0.220,0.039],scale:2} ~ ~ ~ 0.2 0.2 0.2 0 4
    particle dust_color_transition{from_color:[1.000,0.914,0.129],to_color:[1.000,0.988,0.839],scale:2} ~ ~ ~ 0.2 0.2 0.2 0 4

# tp
    scoreboard players set $remaining_loop hvr.temporary 2
    execute positioned ^ ^ ^0.6 run function hvr:asset/object/enemy.explosive_fireball/tick/move

# Add score
    scoreboard players add @s hvr.asset.generic 1

# Autokill
    tag @s[scores={hvr.asset.generic=100..}] add hvr.vanish

# Reset
    scoreboard players reset $remaining_loop hvr.temporary
