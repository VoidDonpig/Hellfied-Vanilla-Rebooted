#> hvr:asset/effect/ominous_bloodlust/tick/
#
# Tick event process
#
# @within function hvr:entity_manager/effect/event/tick/dispatch/m

# SFX
    execute anchored eyes positioned ^ ^ ^ run particle block{block_state:"redstone_block"} ~ ~ ~ 0.2 0.2 0.2 0 1
    execute if predicate hvr:interval/80t if predicate hvr:chance/0.5 anchored eyes positioned ^ ^ ^ run playsound entity.wolf.growl hostile @a[distance=..32] ~ ~ ~ 2 0.7