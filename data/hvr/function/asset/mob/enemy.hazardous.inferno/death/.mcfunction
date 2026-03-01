#> hvr:asset/mob/enemy.hazardous.inferno/death/
#
# Death process
#
# @within function
#   hvr:entity_manager/mob/event/death/dispatch/m
#   hvr:asset/mob/enemy.hazardous.inferno/killed/

# SFX
    playsound entity.blaze.death hostile @a[distance=..16] ~ ~ ~ 1 0.5
    playsound entity.wither.death hostile @a[distance=..16] ~ ~ ~ 0.3 1.4
    playsound block.respawn_anchor.deplete hostile @a[distance=..16] ~ ~ ~ 0.8 0.7
    particle lava ~ ~0.8 ~ 0.2 0.4 0.2 0.2 16
    particle block{block_state:"honeycomb_block"} ~ ~0.8 ~ 0.3 0.6 0.3 0 32

# Vanish
    function hvr:lib/vanish/