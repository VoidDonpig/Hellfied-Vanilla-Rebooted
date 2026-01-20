#> hvr:asset/mob/enderman/break_pumpkin
#
# Break wearing pumpkin
#
# @within function hvr:asset/mob/enderman/attack

# Remove pumpkin
    item replace entity @s armor.head with air

# Spawn pumpkin seed
    execute anchored eyes positioned ^ ^ ^ run summon item ~ ~ ~ {Item:{id:"pumpkin_seeds",count:4},PickupDelay:10}

# SFX
    execute anchored eyes positioned ^ ^ ^ run playsound block.wood.break block @a[distance=..8] ~ ~ ~
    execute anchored eyes positioned ^ ^ ^ run particle block{block_state:"pumpkin"} ~ ~ ~ 0.4 0.4 0.4 0 16