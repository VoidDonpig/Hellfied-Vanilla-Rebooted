#> hvr:asset/mob/husk/give_strong_hunger
#
# Give strong hunger effect to mob run this
#
# @within function hvr:asset/mob/husk/attack

# Give effect
    effect give @s hunger 40 1
    
# SFX
    execute anchored eyes positioned ^ ^ ^ run particle dust{color:[0.380,0.216,0.031],scale:1} ~ ~ ~ 0.4 0.4 0.4 0 16
    execute anchored eyes positioned ^ ^ ^ run playsound block.sand.break hostile @a[distance=..16] ~ ~ ~ 1 0.5